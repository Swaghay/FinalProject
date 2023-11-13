%{       
    open Ast
%}

%token <string> WORD
%token EOF
%token LPAREN
%token RPAREN
%token EQUALS
%start main
%type <string list> main
%%
main:
| line EOF { $1 }
line:
| { [] }
| WORD line { $1 :: $2 }