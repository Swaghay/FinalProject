
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | WITH
    | TYPE
    | STAR
    | RPAREN
    | RECUR
    | PROVE
    | PIPE
    | OF
    | MATCH
    | LPAREN
    | LET
    | INDUCTION
    | IDENT of (
# 23 "lib/parser.mly"
       (string)
# 27 "lib/parser.ml"
  )
    | EQUALS
    | EOF
    | COMMA
    | COLON
    | AXIOM
    | ARROW
  
end

include MenhirBasics

# 1 "lib/parser.mly"
         
    open Ast

# 44 "lib/parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_main) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: main. *)

  | MenhirState03 : (('s, _menhir_box_main) _menhir_cell1_TYPE _menhir_cell0_IDENT, _menhir_box_main) _menhir_state
    (** State 03.
        Stack shape : TYPE IDENT.
        Start symbol: main. *)

  | MenhirState06 : (('s, _menhir_box_main) _menhir_cell1_PIPE _menhir_cell0_IDENT, _menhir_box_main) _menhir_state
    (** State 06.
        Stack shape : PIPE IDENT.
        Start symbol: main. *)

  | MenhirState07 : (('s, _menhir_box_main) _menhir_cell1_STAR, _menhir_box_main) _menhir_state
    (** State 07.
        Stack shape : STAR.
        Start symbol: main. *)

  | MenhirState08 : (('s, _menhir_box_main) _menhir_cell1_LPAREN, _menhir_box_main) _menhir_state
    (** State 08.
        Stack shape : LPAREN.
        Start symbol: main. *)

  | MenhirState13 : (('s, _menhir_box_main) _menhir_cell1_varTup, _menhir_box_main) _menhir_state
    (** State 13.
        Stack shape : varTup.
        Start symbol: main. *)

  | MenhirState16 : (('s, _menhir_box_main) _menhir_cell1_variant, _menhir_box_main) _menhir_state
    (** State 16.
        Stack shape : variant.
        Start symbol: main. *)

  | MenhirState21 : (('s, _menhir_box_main) _menhir_cell1_LET _menhir_cell0_IDENT, _menhir_box_main) _menhir_state
    (** State 21.
        Stack shape : LET IDENT.
        Start symbol: main. *)

  | MenhirState28 : (('s, _menhir_box_main) _menhir_cell1_typedName, _menhir_box_main) _menhir_state
    (** State 28.
        Stack shape : typedName.
        Start symbol: main. *)

  | MenhirState36 : ((('s, _menhir_box_main) _menhir_cell1_LET _menhir_cell0_IDENT, _menhir_box_main) _menhir_cell1_list_typedName_ _menhir_cell0_IDENT _menhir_cell0_IDENT, _menhir_box_main) _menhir_state
    (** State 36.
        Stack shape : LET IDENT list(typedName) IDENT IDENT.
        Start symbol: main. *)

  | MenhirState39 : (('s, _menhir_box_main) _menhir_cell1_PIPE _menhir_cell0_IDENT, _menhir_box_main) _menhir_state
    (** State 39.
        Stack shape : PIPE IDENT.
        Start symbol: main. *)

  | MenhirState40 : (('s, _menhir_box_main) _menhir_cell1_typedName, _menhir_box_main) _menhir_state
    (** State 40.
        Stack shape : typedName.
        Start symbol: main. *)

  | MenhirState44 : ((('s, _menhir_box_main) _menhir_cell1_PIPE _menhir_cell0_IDENT, _menhir_box_main) _menhir_cell1_nonempty_list_typedName_, _menhir_box_main) _menhir_state
    (** State 44.
        Stack shape : PIPE IDENT nonempty_list(typedName).
        Start symbol: main. *)

  | MenhirState45 : (('s, _menhir_box_main) _menhir_cell1_LPAREN, _menhir_box_main) _menhir_state
    (** State 45.
        Stack shape : LPAREN.
        Start symbol: main. *)

  | MenhirState46 : (('s, _menhir_box_main) _menhir_cell1_IDENT, _menhir_box_main) _menhir_state
    (** State 46.
        Stack shape : IDENT.
        Start symbol: main. *)

  | MenhirState48 : (('s, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_state
    (** State 48.
        Stack shape : expression.
        Start symbol: main. *)

  | MenhirState54 : (('s, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_state
    (** State 54.
        Stack shape : expression.
        Start symbol: main. *)

  | MenhirState58 : (('s, _menhir_box_main) _menhir_cell1_PIPE _menhir_cell0_IDENT, _menhir_box_main) _menhir_state
    (** State 58.
        Stack shape : PIPE IDENT.
        Start symbol: main. *)

  | MenhirState60 : (('s, _menhir_box_main) _menhir_cell1_pattern, _menhir_box_main) _menhir_state
    (** State 60.
        Stack shape : pattern.
        Start symbol: main. *)

  | MenhirState64 : (('s, _menhir_box_main) _menhir_cell1_LET _menhir_cell0_IDENT, _menhir_box_main) _menhir_state
    (** State 64.
        Stack shape : LET IDENT.
        Start symbol: main. *)

  | MenhirState67 : ((('s, _menhir_box_main) _menhir_cell1_LET _menhir_cell0_IDENT, _menhir_box_main) _menhir_cell1_list_typedName_, _menhir_box_main) _menhir_state
    (** State 67.
        Stack shape : LET IDENT list(typedName).
        Start symbol: main. *)

  | MenhirState69 : (((('s, _menhir_box_main) _menhir_cell1_LET _menhir_cell0_IDENT, _menhir_box_main) _menhir_cell1_list_typedName_, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_state
    (** State 69.
        Stack shape : LET IDENT list(typedName) expression.
        Start symbol: main. *)

  | MenhirState81 : (('s, _menhir_box_main) _menhir_cell1_declaration, _menhir_box_main) _menhir_state
    (** State 81.
        Stack shape : declaration.
        Start symbol: main. *)


and ('s, 'r) _menhir_cell1_declaration = 
  | MenhirCell1_declaration of 's * ('s, 'r) _menhir_state * (Ast.decl)

and ('s, 'r) _menhir_cell1_expression = 
  | MenhirCell1_expression of 's * ('s, 'r) _menhir_state * (Ast.expression)

and ('s, 'r) _menhir_cell1_list_typedName_ = 
  | MenhirCell1_list_typedName_ of 's * ('s, 'r) _menhir_state * (Ast.typedName list)

and ('s, 'r) _menhir_cell1_nonempty_list_typedName_ = 
  | MenhirCell1_nonempty_list_typedName_ of 's * ('s, 'r) _menhir_state * (Ast.typedName list)

and ('s, 'r) _menhir_cell1_pattern = 
  | MenhirCell1_pattern of 's * ('s, 'r) _menhir_state * (Ast.pattern)

and ('s, 'r) _menhir_cell1_typedName = 
  | MenhirCell1_typedName of 's * ('s, 'r) _menhir_state * (Ast.typedName)

and ('s, 'r) _menhir_cell1_varTup = 
  | MenhirCell1_varTup of 's * ('s, 'r) _menhir_state * (Ast.varTup)

and ('s, 'r) _menhir_cell1_variant = 
  | MenhirCell1_variant of 's * ('s, 'r) _menhir_state * (Ast.variant)

and ('s, 'r) _menhir_cell1_IDENT = 
  | MenhirCell1_IDENT of 's * ('s, 'r) _menhir_state * (
# 23 "lib/parser.mly"
       (string)
# 191 "lib/parser.ml"
)

and 's _menhir_cell0_IDENT = 
  | MenhirCell0_IDENT of 's * (
# 23 "lib/parser.mly"
       (string)
# 198 "lib/parser.ml"
)

and ('s, 'r) _menhir_cell1_LET = 
  | MenhirCell1_LET of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LPAREN = 
  | MenhirCell1_LPAREN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_PIPE = 
  | MenhirCell1_PIPE of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_STAR = 
  | MenhirCell1_STAR of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_TYPE = 
  | MenhirCell1_TYPE of 's * ('s, 'r) _menhir_state

and _menhir_box_main = 
  | MenhirBox_main of (Ast.decl list) [@@unboxed]

let _menhir_action_01 =
  fun l r ->
    (
# 42 "lib/parser.mly"
                                                           (Equality (l,r))
# 224 "lib/parser.ml"
     : (Ast.body))

let _menhir_action_02 =
  fun args b name ->
    (
# 35 "lib/parser.mly"
                                                                                   (ProveAxiom (name, args, b))
# 232 "lib/parser.ml"
     : (Ast.decl))

let _menhir_action_03 =
  fun args b i name ->
    (
# 36 "lib/parser.mly"
                                                                                                                   (ProveInduction (name, args, b, i))
# 240 "lib/parser.ml"
     : (Ast.decl))

let _menhir_action_04 =
  fun args b name ->
    (
# 37 "lib/parser.mly"
                                                                           (Let (name, args, b))
# 248 "lib/parser.ml"
     : (Ast.decl))

let _menhir_action_05 =
  fun args match_name name patterns return ->
    (
# 38 "lib/parser.mly"
                                                                                                                                                                 (LetMatch (name, args, return, match_name, patterns))
# 256 "lib/parser.ml"
     : (Ast.decl))

let _menhir_action_06 =
  fun l name ->
    (
# 39 "lib/parser.mly"
                                                   (Variant (name, l))
# 264 "lib/parser.ml"
     : (Ast.decl))

let _menhir_action_07 =
  fun e ->
    (
# 63 "lib/parser.mly"
                                   (e)
# 272 "lib/parser.ml"
     : (Ast.expression))

let _menhir_action_08 =
  fun f l ->
    (
# 64 "lib/parser.mly"
                                              (Application (f, l))
# 280 "lib/parser.ml"
     : (Ast.expression))

let _menhir_action_09 =
  fun n ->
    (
# 65 "lib/parser.mly"
            (Name n)
# 288 "lib/parser.ml"
     : (Ast.expression))

let _menhir_action_10 =
  fun e ->
    (
# 66 "lib/parser.mly"
                                        (Tuple (e))
# 296 "lib/parser.ml"
     : (Ast.expression))

let _menhir_action_11 =
  fun e ->
    (
# 69 "lib/parser.mly"
                 ([e])
# 304 "lib/parser.ml"
     : (Ast.expression list))

let _menhir_action_12 =
  fun e lst ->
    (
# 70 "lib/parser.mly"
                                                 (e :: lst)
# 312 "lib/parser.ml"
     : (Ast.expression list))

let _menhir_action_13 =
  fun () ->
    (
# 208 "<standard.mly>"
    ( [] )
# 320 "lib/parser.ml"
     : (Ast.decl list))

let _menhir_action_14 =
  fun x xs ->
    (
# 210 "<standard.mly>"
    ( x :: xs )
# 328 "lib/parser.ml"
     : (Ast.decl list))

let _menhir_action_15 =
  fun () ->
    (
# 208 "<standard.mly>"
    ( [] )
# 336 "lib/parser.ml"
     : (Ast.typedName list))

let _menhir_action_16 =
  fun x xs ->
    (
# 210 "<standard.mly>"
    ( x :: xs )
# 344 "lib/parser.ml"
     : (Ast.typedName list))

let _menhir_action_17 =
  fun () ->
    (
# 208 "<standard.mly>"
    ( [] )
# 352 "lib/parser.ml"
     : (Ast.variant list))

let _menhir_action_18 =
  fun x xs ->
    (
# 210 "<standard.mly>"
    ( x :: xs )
# 360 "lib/parser.ml"
     : (Ast.variant list))

let _menhir_action_19 =
  fun decls ->
    (
# 32 "lib/parser.mly"
                                ( decls )
# 368 "lib/parser.ml"
     : (Ast.decl list))

let _menhir_action_20 =
  fun x ->
    (
# 218 "<standard.mly>"
    ( [ x ] )
# 376 "lib/parser.ml"
     : (Ast.expression list))

let _menhir_action_21 =
  fun x xs ->
    (
# 220 "<standard.mly>"
    ( x :: xs )
# 384 "lib/parser.ml"
     : (Ast.expression list))

let _menhir_action_22 =
  fun x ->
    (
# 218 "<standard.mly>"
    ( [ x ] )
# 392 "lib/parser.ml"
     : (Ast.pattern list))

let _menhir_action_23 =
  fun x xs ->
    (
# 220 "<standard.mly>"
    ( x :: xs )
# 400 "lib/parser.ml"
     : (Ast.pattern list))

let _menhir_action_24 =
  fun x ->
    (
# 218 "<standard.mly>"
    ( [ x ] )
# 408 "lib/parser.ml"
     : (Ast.typedName list))

let _menhir_action_25 =
  fun x xs ->
    (
# 220 "<standard.mly>"
    ( x :: xs )
# 416 "lib/parser.ml"
     : (Ast.typedName list))

let _menhir_action_26 =
  fun x ->
    (
# 218 "<standard.mly>"
    ( [ x ] )
# 424 "lib/parser.ml"
     : (Ast.varTup list))

let _menhir_action_27 =
  fun x xs ->
    (
# 220 "<standard.mly>"
    ( x :: xs )
# 432 "lib/parser.ml"
     : (Ast.varTup list))

let _menhir_action_28 =
  fun e lst s ->
    (
# 55 "lib/parser.mly"
                                                                                               (PatternMatch(s, lst, e))
# 440 "lib/parser.ml"
     : (Ast.pattern))

let _menhir_action_29 =
  fun e s ->
    (
# 56 "lib/parser.mly"
                                            (PatternNoArgs(s, e))
# 448 "lib/parser.ml"
     : (Ast.pattern))

let _menhir_action_30 =
  fun var vartype ->
    (
# 45 "lib/parser.mly"
                                                                 (Arguments (var, vartype))
# 456 "lib/parser.ml"
     : (Ast.typedName))

let _menhir_action_31 =
  fun var vartype ->
    (
# 46 "lib/parser.mly"
                                                         (Arguments (var, vartype))
# 464 "lib/parser.ml"
     : (Ast.typedName))

let _menhir_action_32 =
  fun s ->
    (
# 49 "lib/parser.mly"
                      (s)
# 472 "lib/parser.ml"
     : (Ast.varTup))

let _menhir_action_33 =
  fun s ->
    (
# 50 "lib/parser.mly"
                    (s)
# 480 "lib/parser.ml"
     : (Ast.varTup))

let _menhir_action_34 =
  fun s ->
    (
# 51 "lib/parser.mly"
                             (s)
# 488 "lib/parser.ml"
     : (Ast.varTup))

let _menhir_action_35 =
  fun s ->
    (
# 52 "lib/parser.mly"
            (TupSingle s)
# 496 "lib/parser.ml"
     : (Ast.varTup))

let _menhir_action_36 =
  fun s ->
    (
# 59 "lib/parser.mly"
                   (Type (s))
# 504 "lib/parser.ml"
     : (Ast.variant))

let _menhir_action_37 =
  fun l s ->
    (
# 60 "lib/parser.mly"
                                                      (TypeOf (s, l))
# 512 "lib/parser.ml"
     : (Ast.variant))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | ARROW ->
        "ARROW"
    | AXIOM ->
        "AXIOM"
    | COLON ->
        "COLON"
    | COMMA ->
        "COMMA"
    | EOF ->
        "EOF"
    | EQUALS ->
        "EQUALS"
    | IDENT _ ->
        "IDENT"
    | INDUCTION ->
        "INDUCTION"
    | LET ->
        "LET"
    | LPAREN ->
        "LPAREN"
    | MATCH ->
        "MATCH"
    | OF ->
        "OF"
    | PIPE ->
        "PIPE"
    | PROVE ->
        "PROVE"
    | RECUR ->
        "RECUR"
    | RPAREN ->
        "RPAREN"
    | STAR ->
        "STAR"
    | TYPE ->
        "TYPE"
    | WITH ->
        "WITH"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37"]
  
  let _menhir_run_79 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_main =
    fun _menhir_stack _v ->
      let decls = _v in
      let _v = _menhir_action_19 decls in
      MenhirBox_main _v
  
  let rec _menhir_run_82 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_declaration -> _ -> _menhir_box_main =
    fun _menhir_stack _v ->
      let MenhirCell1_declaration (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_14 x xs in
      _menhir_goto_list_declaration_ _menhir_stack _v _menhir_s
  
  and _menhir_goto_list_declaration_ : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _v _menhir_s ->
      match _menhir_s with
      | MenhirState81 ->
          _menhir_run_82 _menhir_stack _v
      | MenhirState00 ->
          _menhir_run_79 _menhir_stack _v
      | _ ->
          _menhir_fail ()
  
  let rec _menhir_run_01 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_TYPE (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | EQUALS ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | PIPE ->
                  _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
              | EOF | LET | TYPE ->
                  let _v_0 = _menhir_action_17 () in
                  _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_04 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | OF ->
              let _menhir_stack = MenhirCell1_PIPE (_menhir_stack, _menhir_s) in
              let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v) in
              let _menhir_s = MenhirState06 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | STAR ->
                  _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LPAREN ->
                  _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | IDENT _v ->
                  _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | _ ->
                  _eRR ())
          | EOF | LET | PIPE | TYPE ->
              let s = _v in
              let _v = _menhir_action_36 s in
              _menhir_goto_variant _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_07 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_STAR (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState07 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STAR ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_08 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState08 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STAR ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_09 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let s = _v in
      let _v = _menhir_action_35 s in
      _menhir_goto_varTup _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_varTup : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState13 ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState06 ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState07 ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState08 ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_13 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | STAR ->
          let _menhir_stack = MenhirCell1_varTup (_menhir_stack, _menhir_s, _v) in
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
      | LPAREN ->
          let _menhir_stack = MenhirCell1_varTup (_menhir_stack, _menhir_s, _v) in
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
      | IDENT _v_0 ->
          let _menhir_stack = MenhirCell1_varTup (_menhir_stack, _menhir_s, _v) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState13
      | EOF | LET | PIPE | TYPE ->
          let x = _v in
          let _v = _menhir_action_26 x in
          _menhir_goto_nonempty_list_varTup_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_nonempty_list_varTup_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState06 ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState13 ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_15 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_PIPE _menhir_cell0_IDENT -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell0_IDENT (_menhir_stack, s) = _menhir_stack in
      let MenhirCell1_PIPE (_menhir_stack, _menhir_s) = _menhir_stack in
      let l = _v in
      let _v = _menhir_action_37 l s in
      _menhir_goto_variant _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_variant : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_variant (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | PIPE ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
      | EOF | LET | TYPE ->
          let _v_0 = _menhir_action_17 () in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_17 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_variant -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_variant (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_18 x xs in
      _menhir_goto_list_variant_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_list_variant_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState03 ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState16 ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_18 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_TYPE _menhir_cell0_IDENT -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell0_IDENT (_menhir_stack, name) = _menhir_stack in
      let MenhirCell1_TYPE (_menhir_stack, _menhir_s) = _menhir_stack in
      let l = _v in
      let _v = _menhir_action_06 l name in
      _menhir_goto_declaration _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_declaration : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_declaration (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | TYPE ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState81
      | LET ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState81
      | EOF ->
          let _v_0 = _menhir_action_13 () in
          _menhir_run_82 _menhir_stack _v_0
      | _ ->
          _eRR ()
  
  and _menhir_run_19 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LET (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | RECUR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v ->
              let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | LPAREN ->
                  _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState21
              | COLON ->
                  let _v_0 = _menhir_action_15 () in
                  _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState21 _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | PROVE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v ->
              let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | LPAREN ->
                  _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState64
              | EQUALS ->
                  let _v_1 = _menhir_action_15 () in
                  _menhir_run_65 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState64 _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_22 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | COLON ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | IDENT _v_0 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | RPAREN ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | COMMA ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          let (vartype, var) = (_v_0, _v) in
                          let _v = _menhir_action_30 var vartype in
                          _menhir_goto_typedName _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
                      | COLON | EQUALS | LPAREN | RPAREN ->
                          let (vartype, var) = (_v_0, _v) in
                          let _v = _menhir_action_31 var vartype in
                          _menhir_goto_typedName _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
                      | _ ->
                          _eRR ())
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_typedName : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState40 ->
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState39 ->
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState64 ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState28 ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState21 ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_40 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _menhir_stack = MenhirCell1_typedName (_menhir_stack, _menhir_s, _v) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
      | RPAREN ->
          let x = _v in
          let _v = _menhir_action_24 x in
          _menhir_goto_nonempty_list_typedName_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_nonempty_list_typedName_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState39 ->
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState40 ->
          _menhir_run_41 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_42 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PIPE _menhir_cell0_IDENT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_nonempty_list_typedName_ (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ARROW ->
          let _menhir_s = MenhirState44 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAREN ->
              _menhir_run_45 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_45 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState45 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          _menhir_run_45 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_46 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, _menhir_s, _v) in
          _menhir_run_45 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState46
      | IDENT _v_0 ->
          let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, _menhir_s, _v) in
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState46
      | COMMA | EOF | EQUALS | LET | PIPE | RPAREN | TYPE ->
          let n = _v in
          let _v = _menhir_action_09 n in
          _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_expression : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState69 ->
          _menhir_run_70 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState67 ->
          _menhir_run_68 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState58 ->
          _menhir_run_59 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState44 ->
          _menhir_run_57 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState54 ->
          _menhir_run_56 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState45 ->
          _menhir_run_52 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState48 ->
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState46 ->
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_70 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_LET _menhir_cell0_IDENT, _menhir_box_main) _menhir_cell1_list_typedName_, _menhir_box_main) _menhir_cell1_expression -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_expression (_menhir_stack, _, l) = _menhir_stack in
          let r = _v in
          let _v = _menhir_action_01 l r in
          (match (_tok : MenhirBasics.token) with
          | INDUCTION ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | IDENT _v_0 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | STAR ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | RPAREN ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          let MenhirCell1_list_typedName_ (_menhir_stack, _, args) = _menhir_stack in
                          let MenhirCell0_IDENT (_menhir_stack, name) = _menhir_stack in
                          let MenhirCell1_LET (_menhir_stack, _menhir_s) = _menhir_stack in
                          let (b, i) = (_v, _v_0) in
                          let _v = _menhir_action_03 args b i name in
                          _menhir_goto_declaration _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
                      | _ ->
                          _eRR ())
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | AXIOM ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let MenhirCell1_list_typedName_ (_menhir_stack, _, args) = _menhir_stack in
              let MenhirCell0_IDENT (_menhir_stack, name) = _menhir_stack in
              let MenhirCell1_LET (_menhir_stack, _menhir_s) = _menhir_stack in
              let b = _v in
              let _v = _menhir_action_02 args b name in
              _menhir_goto_declaration _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | EOF | LET | TYPE ->
              let MenhirCell1_list_typedName_ (_menhir_stack, _, args) = _menhir_stack in
              let MenhirCell0_IDENT (_menhir_stack, name) = _menhir_stack in
              let MenhirCell1_LET (_menhir_stack, _menhir_s) = _menhir_stack in
              let b = _v in
              let _v = _menhir_action_04 args b name in
              _menhir_goto_declaration _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_68 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_LET _menhir_cell0_IDENT, _menhir_box_main) _menhir_cell1_list_typedName_ as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | EQUALS ->
          let _menhir_s = MenhirState69 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAREN ->
              _menhir_run_45 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_59 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_PIPE _menhir_cell0_IDENT -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell0_IDENT (_menhir_stack, s) = _menhir_stack in
      let MenhirCell1_PIPE (_menhir_stack, _menhir_s) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_29 e s in
      _menhir_goto_pattern _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_pattern : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PIPE ->
          let _menhir_stack = MenhirCell1_pattern (_menhir_stack, _menhir_s, _v) in
          _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState60
      | EOF | LET | TYPE ->
          let x = _v in
          let _v = _menhir_action_22 x in
          _menhir_goto_nonempty_list_pattern_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_37 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_PIPE (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAREN ->
              let _menhir_s = MenhirState39 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | LPAREN ->
                  _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | _ ->
                  _eRR ())
          | ARROW ->
              let _menhir_s = MenhirState58 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | LPAREN ->
                  _menhir_run_45 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | IDENT _v ->
                  _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_nonempty_list_pattern_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState36 ->
          _menhir_run_62 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState60 ->
          _menhir_run_61 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_62 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_LET _menhir_cell0_IDENT, _menhir_box_main) _menhir_cell1_list_typedName_ _menhir_cell0_IDENT _menhir_cell0_IDENT -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell0_IDENT (_menhir_stack, match_name) = _menhir_stack in
      let MenhirCell0_IDENT (_menhir_stack, return) = _menhir_stack in
      let MenhirCell1_list_typedName_ (_menhir_stack, _, args) = _menhir_stack in
      let MenhirCell0_IDENT (_menhir_stack, name) = _menhir_stack in
      let MenhirCell1_LET (_menhir_stack, _menhir_s) = _menhir_stack in
      let patterns = _v in
      let _v = _menhir_action_05 args match_name name patterns return in
      _menhir_goto_declaration _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_61 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_pattern -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_pattern (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_23 x xs in
      _menhir_goto_nonempty_list_pattern_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_57 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PIPE _menhir_cell0_IDENT, _menhir_box_main) _menhir_cell1_nonempty_list_typedName_ -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_nonempty_list_typedName_ (_menhir_stack, _, lst) = _menhir_stack in
      let MenhirCell0_IDENT (_menhir_stack, s) = _menhir_stack in
      let MenhirCell1_PIPE (_menhir_stack, _menhir_s) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_28 e lst s in
      _menhir_goto_pattern _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_56 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_expression as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_54 _menhir_stack _menhir_lexbuf _menhir_lexer
      | RPAREN ->
          let e = _v in
          let _v = _menhir_action_11 e in
          _menhir_goto_expression_list _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_54 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expression -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState54 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          _menhir_run_45 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_expression_list : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState54 ->
          _menhir_run_55 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState45 ->
          _menhir_run_50 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_55 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expression -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_expression (_menhir_stack, _menhir_s, e) = _menhir_stack in
      let lst = _v in
      let _v = _menhir_action_12 e lst in
      _menhir_goto_expression_list _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_50 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_LPAREN -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_10 e in
      _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_52 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_LPAREN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
          let e = _v in
          let _v = _menhir_action_07 e in
          _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | COMMA ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_54 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_48 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_45 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState48
      | IDENT _v_0 ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState48
      | COMMA | EOF | EQUALS | LET | PIPE | RPAREN | TYPE ->
          let x = _v in
          let _v = _menhir_action_20 x in
          _menhir_goto_nonempty_list_expression_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_nonempty_list_expression_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState48 ->
          _menhir_run_49 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState46 ->
          _menhir_run_47 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_49 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expression -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expression (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_21 x xs in
      _menhir_goto_nonempty_list_expression_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_47 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_IDENT -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_IDENT (_menhir_stack, _menhir_s, f) = _menhir_stack in
      let l = _v in
      let _v = _menhir_action_08 f l in
      _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_41 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_typedName -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_typedName (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_25 x xs in
      _menhir_goto_nonempty_list_typedName_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_28 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_typedName (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState28
      | COLON | EQUALS ->
          let _v_0 = _menhir_action_15 () in
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_29 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_typedName -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_typedName (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_16 x xs in
      _menhir_goto_list_typedName_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_list_typedName_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState64 ->
          _menhir_run_65 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState21 ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState28 ->
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_65 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_LET _menhir_cell0_IDENT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_list_typedName_ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | EQUALS ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAREN ->
              let _menhir_s = MenhirState67 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | LPAREN ->
                  _menhir_run_45 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | IDENT _v ->
                  _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_30 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_LET _menhir_cell0_IDENT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_list_typedName_ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | COLON ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v ->
              let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | EQUALS ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | MATCH ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | IDENT _v ->
                          let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v) in
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          (match (_tok : MenhirBasics.token) with
                          | WITH ->
                              let _menhir_s = MenhirState36 in
                              let _tok = _menhir_lexer _menhir_lexbuf in
                              (match (_tok : MenhirBasics.token) with
                              | PIPE ->
                                  _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                              | _ ->
                                  _eRR ())
                          | _ ->
                              _eRR ())
                      | _ ->
                          _eRR ())
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_14 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_varTup -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_varTup (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_27 x xs in
      _menhir_goto_nonempty_list_varTup_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_11 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_STAR -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_STAR (_menhir_stack, _menhir_s) = _menhir_stack in
          let s = _v in
          let _v = _menhir_action_34 s in
          _menhir_goto_varTup _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | EOF | IDENT _ | LET | LPAREN | PIPE | STAR | TYPE ->
          let MenhirCell1_STAR (_menhir_stack, _menhir_s) = _menhir_stack in
          let s = _v in
          let _v = _menhir_action_33 s in
          _menhir_goto_varTup _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_10 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_LPAREN -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
      let s = _v in
      let _v = _menhir_action_32 s in
      _menhir_goto_varTup _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  let _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TYPE ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | LET ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | EOF ->
          let _v = _menhir_action_13 () in
          _menhir_run_79 _menhir_stack _v
      | _ ->
          _eRR ()
  
end

let main =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_main v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
