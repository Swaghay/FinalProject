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
%token HINT
%token STAR
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
| LET ; PROVE ; name = IDENT ;  args = list(typedName) ; EQUALS ; left = expression ; EQUALS ; right = expression {Prove (name, args, left, right)}
| LET ; name = IDENT ;  args = list(typedName) ; EQUALS ; left = expression ; EQUALS ; right = expression {Let (name, args, left, right)}
| HINT ; h = list(usefulComment) ; STAR ; RPAREN {Hint (h)}

typedName:
LPAREN ; var = IDENT ; COLON ; vartype = IDENT; RPAREN {Arguments (var, vartype)}

expression:
| LPAREN ; e = expression ; RPAREN {e}
| e = expression ; RPAREN {e}
| LPAREN ; e = expression {e}
| f = IDENT ; l = nonempty_list(expression) ; {Application (f, l)}
| n = IDENT {Name n}

usefulComment:
s = IDENT {S (s)}