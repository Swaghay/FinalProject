
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | RPAREN
    | PROVE
    | LPAREN
    | LET
    | IDENT of (
# 12 "lib/parser.mly"
       (string)
# 19 "lib/parser.ml"
  )
    | EQUALS
    | EOF
    | COLON
  
end

include MenhirBasics

# 1 "lib/parser.mly"
         
    open Ast

# 33 "lib/parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_main) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: main. *)

  | MenhirState03 : (('s, _menhir_box_main) _menhir_cell1_LET _menhir_cell0_IDENT, _menhir_box_main) _menhir_state
    (** State 03.
        Stack shape : LET IDENT.
        Start symbol: main. *)

  | MenhirState09 : (('s, _menhir_box_main) _menhir_cell1_typedName, _menhir_box_main) _menhir_state
    (** State 09.
        Stack shape : typedName.
        Start symbol: main. *)

  | MenhirState12 : ((('s, _menhir_box_main) _menhir_cell1_LET _menhir_cell0_IDENT, _menhir_box_main) _menhir_cell1_list_typedName_, _menhir_box_main) _menhir_state
    (** State 12.
        Stack shape : LET IDENT list(typedName).
        Start symbol: main. *)

  | MenhirState13 : (('s, _menhir_box_main) _menhir_cell1_LPAREN, _menhir_box_main) _menhir_state
    (** State 13.
        Stack shape : LPAREN.
        Start symbol: main. *)

  | MenhirState14 : (('s, _menhir_box_main) _menhir_cell1_IDENT, _menhir_box_main) _menhir_state
    (** State 14.
        Stack shape : IDENT.
        Start symbol: main. *)

  | MenhirState16 : (('s, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_state
    (** State 16.
        Stack shape : expression.
        Start symbol: main. *)

  | MenhirState21 : (((('s, _menhir_box_main) _menhir_cell1_LET _menhir_cell0_IDENT, _menhir_box_main) _menhir_cell1_list_typedName_, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_state
    (** State 21.
        Stack shape : LET IDENT list(typedName) expression.
        Start symbol: main. *)

  | MenhirState26 : (('s, _menhir_box_main) _menhir_cell1_declaration, _menhir_box_main) _menhir_state
    (** State 26.
        Stack shape : declaration.
        Start symbol: main. *)


and ('s, 'r) _menhir_cell1_declaration = 
  | MenhirCell1_declaration of 's * ('s, 'r) _menhir_state * (Ast.decl)

and ('s, 'r) _menhir_cell1_expression = 
  | MenhirCell1_expression of 's * ('s, 'r) _menhir_state * (Ast.expression)

and ('s, 'r) _menhir_cell1_list_typedName_ = 
  | MenhirCell1_list_typedName_ of 's * ('s, 'r) _menhir_state * (Ast.typedName list)

and ('s, 'r) _menhir_cell1_typedName = 
  | MenhirCell1_typedName of 's * ('s, 'r) _menhir_state * (Ast.typedName)

and ('s, 'r) _menhir_cell1_IDENT = 
  | MenhirCell1_IDENT of 's * ('s, 'r) _menhir_state * (
# 12 "lib/parser.mly"
       (string)
# 98 "lib/parser.ml"
)

and 's _menhir_cell0_IDENT = 
  | MenhirCell0_IDENT of 's * (
# 12 "lib/parser.mly"
       (string)
# 105 "lib/parser.ml"
)

and ('s, 'r) _menhir_cell1_LET = 
  | MenhirCell1_LET of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LPAREN = 
  | MenhirCell1_LPAREN of 's * ('s, 'r) _menhir_state

and _menhir_box_main = 
  | MenhirBox_main of (Ast.decl list) [@@unboxed]

let _menhir_action_01 =
  fun args left name right ->
    (
# 24 "lib/parser.mly"
                                                                                                                (Let (name, args, left, right))
# 122 "lib/parser.ml"
     : (Ast.decl))

let _menhir_action_02 =
  fun e ->
    (
# 30 "lib/parser.mly"
                                   (e)
# 130 "lib/parser.ml"
     : (Ast.expression))

let _menhir_action_03 =
  fun f l ->
    (
# 31 "lib/parser.mly"
                                              (Application (f, l))
# 138 "lib/parser.ml"
     : (Ast.expression))

let _menhir_action_04 =
  fun n ->
    (
# 32 "lib/parser.mly"
            (Name n)
# 146 "lib/parser.ml"
     : (Ast.expression))

let _menhir_action_05 =
  fun () ->
    (
# 208 "<standard.mly>"
    ( [] )
# 154 "lib/parser.ml"
     : (Ast.decl list))

let _menhir_action_06 =
  fun x xs ->
    (
# 210 "<standard.mly>"
    ( x :: xs )
# 162 "lib/parser.ml"
     : (Ast.decl list))

let _menhir_action_07 =
  fun () ->
    (
# 208 "<standard.mly>"
    ( [] )
# 170 "lib/parser.ml"
     : (Ast.typedName list))

let _menhir_action_08 =
  fun x xs ->
    (
# 210 "<standard.mly>"
    ( x :: xs )
# 178 "lib/parser.ml"
     : (Ast.typedName list))

let _menhir_action_09 =
  fun decls ->
    (
# 21 "lib/parser.mly"
                                ( decls )
# 186 "lib/parser.ml"
     : (Ast.decl list))

let _menhir_action_10 =
  fun x ->
    (
# 218 "<standard.mly>"
    ( [ x ] )
# 194 "lib/parser.ml"
     : (Ast.expression list))

let _menhir_action_11 =
  fun x xs ->
    (
# 220 "<standard.mly>"
    ( x :: xs )
# 202 "lib/parser.ml"
     : (Ast.expression list))

let _menhir_action_12 =
  fun var vartype ->
    (
# 27 "lib/parser.mly"
                                                       (Arguments (var, vartype))
# 210 "lib/parser.ml"
     : (Ast.typedName))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | COLON ->
        "COLON"
    | EOF ->
        "EOF"
    | EQUALS ->
        "EQUALS"
    | IDENT _ ->
        "IDENT"
    | LET ->
        "LET"
    | LPAREN ->
        "LPAREN"
    | PROVE ->
        "PROVE"
    | RPAREN ->
        "RPAREN"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37"]
  
  let _menhir_run_24 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_main =
    fun _menhir_stack _v ->
      let decls = _v in
      let _v = _menhir_action_09 decls in
      MenhirBox_main _v
  
  let rec _menhir_run_27 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_declaration -> _ -> _menhir_box_main =
    fun _menhir_stack _v ->
      let MenhirCell1_declaration (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_06 x xs in
      _menhir_goto_list_declaration_ _menhir_stack _v _menhir_s
  
  and _menhir_goto_list_declaration_ : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _v _menhir_s ->
      match _menhir_s with
      | MenhirState26 ->
          _menhir_run_27 _menhir_stack _v
      | MenhirState00 ->
          _menhir_run_24 _menhir_stack _v
      | _ ->
          _menhir_fail ()
  
  let rec _menhir_run_01 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LET (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | PROVE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v ->
              let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | LPAREN ->
                  _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
              | EQUALS ->
                  let _v_0 = _menhir_action_07 () in
                  _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState03
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
          | COLON ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | IDENT _v_0 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | RPAREN ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let (vartype, var) = (_v_0, _v) in
                      let _v = _menhir_action_12 var vartype in
                      let _menhir_stack = MenhirCell1_typedName (_menhir_stack, _menhir_s, _v) in
                      (match (_tok : MenhirBasics.token) with
                      | LPAREN ->
                          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState09
                      | EQUALS ->
                          let _v_0 = _menhir_action_07 () in
                          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
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
  
  and _menhir_run_10 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_typedName -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_typedName (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_08 x xs in
      _menhir_goto_list_typedName_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_list_typedName_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState03 ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState09 ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_11 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_LET _menhir_cell0_IDENT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_list_typedName_ (_menhir_stack, _menhir_s, _v) in
      let _menhir_s = MenhirState12 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_13 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState13 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_14 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, _menhir_s, _v) in
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState14
      | IDENT _v_0 ->
          let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, _menhir_s, _v) in
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState14
      | EOF | EQUALS | LET | RPAREN ->
          let n = _v in
          let _v = _menhir_action_04 n in
          _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_expression : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState21 ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState12 ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState13 ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState16 ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState14 ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_22 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_LET _menhir_cell0_IDENT, _menhir_box_main) _menhir_cell1_list_typedName_, _menhir_box_main) _menhir_cell1_expression -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expression (_menhir_stack, _, left) = _menhir_stack in
      let MenhirCell1_list_typedName_ (_menhir_stack, _, args) = _menhir_stack in
      let MenhirCell0_IDENT (_menhir_stack, name) = _menhir_stack in
      let MenhirCell1_LET (_menhir_stack, _menhir_s) = _menhir_stack in
      let right = _v in
      let _v = _menhir_action_01 args left name right in
      let _menhir_stack = MenhirCell1_declaration (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | LET ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState26
      | EOF ->
          let _v_0 = _menhir_action_05 () in
          _menhir_run_27 _menhir_stack _v_0
      | _ ->
          _eRR ()
  
  and _menhir_run_20 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_LET _menhir_cell0_IDENT, _menhir_box_main) _menhir_cell1_list_typedName_ as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | EQUALS ->
          let _menhir_s = MenhirState21 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAREN ->
              _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_18 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_LPAREN -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
          let e = _v in
          let _v = _menhir_action_02 e in
          _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_16 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
      | IDENT _v_0 ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState16
      | EOF | EQUALS | LET | RPAREN ->
          let x = _v in
          let _v = _menhir_action_10 x in
          _menhir_goto_nonempty_list_expression_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_nonempty_list_expression_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState16 ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState14 ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_17 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expression -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expression (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_11 x xs in
      _menhir_goto_nonempty_list_expression_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_15 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_IDENT -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_IDENT (_menhir_stack, _menhir_s, f) = _menhir_stack in
      let l = _v in
      let _v = _menhir_action_03 f l in
      _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  let _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LET ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | EOF ->
          let _v = _menhir_action_05 () in
          _menhir_run_24 _menhir_stack _v
      | _ ->
          _eRR ()
  
end

let main =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_main v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
