%{       
    open Ast
%}

%token EOF
%token LPAREN
%token RPAREN
%token EQUALS
%token LET
%token RECUR
%token TYPE
%token COLON
%token PROVE
%token COMMA
%token PIPE
%token OF
%token MATCH
%token ARROW
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
%%

main:
decls = list(declaration) ; EOF { decls }

declaration:
| LET ; PROVE ; name = IDENT ;  args = list(typedName) ; EQUALS ; b = body ; AXIOM {ProveAxiom (name, args, b)}
| LET ; PROVE ; name = IDENT ;  args = list(typedName) ; EQUALS ; b = body ; INDUCTION ; i = IDENT ; STAR ; RPAREN {ProveInduction (name, args, b, i)}
| LET ; PROVE ; name = IDENT ;  args = list(typedName) ; EQUALS ; b = body {Let (name, args, b)}
| LET ; RECUR ; name = IDENT ;  args = list(typedName) ; COLON ; return = IDENT ; EQUALS ; MATCH ; match_name = IDENT ; WITH ; patterns = nonempty_list(pattern) {LetMatch (name, args, return, match_name, patterns)}
| TYPE ; name = IDENT ; EQUALS ; l = list(variant) {Variant (name, l)}

body:
LPAREN ; l = expression ; EQUALS ; r = expression ; RPAREN {Equality (l,r)}

typedName:
| LPAREN ; var = IDENT ; COLON ; vartype = IDENT; RPAREN ; COMMA {Arguments (var, vartype)}
| LPAREN ; var = IDENT ; COLON ; vartype = IDENT; RPAREN {Arguments (var, vartype)}

varTup:
| LPAREN ; s = varTup {s}
| STAR ; s = varTup {s}
| STAR ; s = varTup ; RPAREN {s}
| s = IDENT {TupSingle s}

pattern:
| PIPE ; s = IDENT ; LPAREN ; lst = nonempty_list(typedName) ; RPAREN ; ARROW ; e = expression {PatternMatch(s, lst, e)}
| PIPE ; s = IDENT ; ARROW ; e = expression {PatternNoArgs(s, e)}

variant:
| PIPE ; s = IDENT {Type (s)}
| PIPE ; s = IDENT ; OF ; l = nonempty_list(varTup) ; {TypeOf (s, l)}

expression:
| LPAREN ; e = expression ; RPAREN {e}
| f = IDENT ; l = nonempty_list(expression) ; {Application (f, l)}
| n = IDENT {Name n}
| LPAREN ; e = expression_list ; RPAREN {Tuple (e)}

expression_list:
| e = expression {[e]}
| e = expression ; COMMA ; lst = expression_list {e :: lst}
(*We had to google how to put expressions into a list in a parser*)


(* MatchStatement ((PatternMatch ("Cons", (Arguments ("h", "int"), Arguments ("t", "list")))),(Application ("Cons",  [h, Application ("append", [t,l2])]))) *)