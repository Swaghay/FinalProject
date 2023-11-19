%{       
    open Ast
%}

%token EOF
%token LPAREN
%token RPAREN
%token EQUALS
%token LET
%token RECURSION
%token CLOSEHINT
%token TYPE
%token COLON
%token PROVE
%token PIPE
%token OF
%token MATCH
%token WITH
%token STAR
%token AXIOM 
%token INDUCTION
%token <string> IDENT
%start main
%type <decl list> main
%type <decl> declaration
%type <typedName> typedName
%type <expression> expression
%type <expression> match_expr
%type <body> match_body
%%

main:
decls = list(declaration) ; EOF { decls }

declaration:
| LET ; PROVE ; name = IDENT ;  args = list(typedName) ; EQUALS ; b = body ; AXIOM {ProveAxiom (name, args, b)}
| LET ; PROVE ; name = IDENT ;  args = list(typedName) ; EQUALS ; b = body ; INDUCTION ; i = IDENT ; STAR ; RPAREN {ProveInduction (name, args, b, i)}
| LET ; PROVE ; name = IDENT ;  args = list(typedName) ; EQUALS ; b = body {Let (name, args, b)}
| LET ; RECURSION ; PROVE ; name = IDENT ;  args = list(typedName) ; COLON ; return = IDENT ; EQUALS ; MATCH ; match_name = IDENT ; WITH (*TODO: add pattern*)
| TYPE ; name = IDENT ; EQUALS ; l = list(variant) {Variant (name, l)}

body:
LPAREN ; l = expression ; EQUALS ; r = expression ; RPAREN {Equality (l,r)}

typedName:
LPAREN ; var = IDENT ; COLON ; vartype = IDENT; RPAREN {Arguments (var, vartype)}

varTup:
| LPAREN ; s = varTup {s}
| STAR ; s = varTup {s}
| STAR ; s = varTup ; RPAREN {s}
| s = IDENT {TupSingle s}

variant:
| PIPE ; s = IDENT {Type (s)}
| PIPE ; s = IDENT ; OF ; l = nonempty_list(varTup) ; {TypeOf (s, l)}

expression:
| LPAREN ; e = expression ; RPAREN {e}
| f = IDENT ; l = nonempty_list(expression) ; {Application (f, l)}
| n = IDENT {Name n}
| match_expr { match_expr }

body:
  | LPAREN ; l = expression ; EQUALS ; r = expression ; RPAREN { Equality (l, r) }
  | match_body { match_body }


(* Pattern ((Application ("Cons", (Some way to store (h : int), (t : list)), (Application ("Cons", (Some way to store (h, append t l2))) *)