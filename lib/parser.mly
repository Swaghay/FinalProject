%{       
    open Ast
%}

%token EOF
%token LPAREN
%token RPAREN
%token EQUALS
%token LET
%token REC
// %token TYPE
%token COLON
%token PROVE
/* %token PIPE
%token OF */
%token STAR
%token AXIOM 
%token INDUCTION
%token <string> IDENT
%start main
%type <decl list> main
%type <decl> declaration
%type <typedName> typedName
%type <expression> expression
%%

main:
decls = list(declaration) ; EOF { decls }

declaration:
| LET ; PROVE ; name = IDENT ;  args = list(typedName) ; EQUALS ; b = body ; AXIOM {ProveAxiom (name, args, b)}
| LET ; PROVE ; name = IDENT ;  args = list(typedName) ; EQUALS ; b = body ; INDUCTION ; i = IDENT ; STAR ; RPAREN {ProveInduction (name, args, b, i)}
| LET ; PROVE ; name = IDENT ;  args = list(typedName) ; EQUALS ; b = body {Let (name, args, b)}
// | TYPE ; name = IDENT ; EQUALS ; l = list(variant) {Variant (name, l)}

body:
LPAREN ; l = expression ; EQUALS ; r = expression ; RPAREN {Equality (l,r)}

typedName:
LPAREN ; var = IDENT ; COLON ; vartype = IDENT; RPAREN {Arguments (var, vartype)}

/* variant:
| PIPE ; s = IDENT {Type (s)}
| PIPE ; s = IDENT ; l = nonempty_list(expression) ; {TypeOf (s, l)} */

expression:
| LPAREN ; e = expression ; RPAREN {e}
| f = IDENT ; l = nonempty_list(expression) ; {Application (f, l)}
| n = IDENT {Name n}
