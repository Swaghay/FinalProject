%{       
    open Ast
%}

%token EOF
%token LPAREN
%token RPAREN
%token EQUALS
%token LET
%token COLON
%token PROVE
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
LET ; PROVE ; name = IDENT ;  args = list(typedName) ; EQUALS ; left = expression ; EQUALS ; right = expression {Prove (name, args, left, right)}
LET ; name = IDENT ;  args = list(typedName) ; EQUALS ; left = expression ; EQUALS ; right = expression {Let (name, args, left, right)}

typedName:
LPAREN ; var = IDENT ; COLON ; vartype = IDENT; RPAREN {Arguments (var, vartype)}

expression:
| LPAREN ; e = expression ; RPAREN {e}
| f = IDENT ; l = nonempty_list(expression) ; {Application (f, l)}
| n = IDENT {Name n}