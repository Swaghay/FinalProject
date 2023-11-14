%{       
    open Ast
%}

%token <string> WORD
%token EOF
%token LPAREN
%token RPAREN
%token EQUALS
%token LET
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
LET ; string