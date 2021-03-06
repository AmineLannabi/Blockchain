(******************************************************************************)
(*     Copyright (C) OCamlPro SAS                                             *)
(******************************************************************************)

val block_reward : int
val pow_challenge : int

val hash_string : string -> string
val hash_file : string -> string
val sufficient_pow : Types.pow -> string -> bool

val blocks_dir : string -> string

val transactions_dir : string -> pending:bool -> string

val accounts_dir : string -> string

val empty_blockchain : Types.genesis -> Types.blockchain

val mk_block_content :
  Types.miner_id ->
  Types.trans_id list ->
  Types.block ->
  Types.nonce ->
  Types.pow ->
  Types.block_content

val get_genesis : Types.genesis

val block_content_to_string :
  Types.block_content ->
  string  (* string content * hash *)

val check_chain_of_blocks : Types.block list -> Types.genesis -> bool
