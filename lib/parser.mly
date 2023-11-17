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
| LET ; PROVE ; name = IDENT ;  args = list(typedName) ; EQUALS ; left = expression ; EQUALS ; right = expression ; AXIOM {ProveAxiom (name, args, left, right)}
| LET ; PROVE ; name = IDENT ;  args = list(typedName) ; EQUALS ; left = expression ; EQUALS ; right = expression ; INDUCTION ; i = IDENT ; STAR ; RPAREN {ProveInduction (name, args, left, right, i)}
| LET ; PROVE ; name = IDENT ;  args = list(typedName) ; EQUALS ; left = expression ; EQUALS ; right = expression {Let (name, args, left, right)}
// | TYPE ; name = IDENT ; EQUALS ; l = list(variant) {Variant (name, l)}

typedName:
LPAREN ; var = IDENT ; COLON ; vartype = IDENT; RPAREN {Arguments (var, vartype)}

/* variant:
| PIPE ; s = IDENT {Type (s)}
| PIPE ; s = IDENT ; l = nonempty_list(expression) ; {TypeOf (s, l)} */

expression:
| LPAREN ; e = expression ; RPAREN {e}
| e = expression ; RPAREN {e}
| LPAREN ; e = expression {e}
| f = IDENT ; l = nonempty_list(expression) ; {Application (f, l)}
| n = IDENT {Name n}
