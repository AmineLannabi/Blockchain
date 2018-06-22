(******************************************************************************)
(*     Copyright (C) OCamlPro SAS                                             *)
(******************************************************************************)

open Types
open Format

let block_reward = 10

let pow_challenge = 20

let hash_string s = Digest.string s |> Digest.to_hex

let hash_file s = Digest.file s |> Digest.to_hex


let sufficient_pow pow b_hash =
  (* Check if the numbers of zéros in the left of the hash is equal to pow*)
  (String.sub b_hash 0 (pow/4)) = String.make (pow/4) '0' 

let blocks_dir wdir =
  (* TODO *)
  assert false

let transactions_dir wdir ~pending =
  (* TODO *)
  assert false

let accounts_dir wdir =
  (* TODO *)
  assert false


let empty_blockchain genesis =
	(*DONE*)
  let database = {
		blocks = [genesis.g_block];
		trans = [];
		pending_trans = [];
		accounts = [];
	}
	in
	{
		genesis = genesis;
		db = database;
		peers_db = Util.MS.empty
	}
	
  

let mk_block_content b_miner b_transactions previous b_nonce b_pow =
  (* DONE *)
	{
		b_previous = previous.block_info;
		b_miner = b_miner;
		b_pow = b_pow;
		b_date = Util.Date.now ();
		b_nonce = b_nonce;
		b_transactions = b_transactions
	}
	
			

let block_content_to_string b_content =
  (* DONE *)
	(*"level : " ^ (string_of_int (b_content.b_previous.b_level + 1)) ^ "\n" ^*)
	
	"previous " ^ (string_of_int b_content.b_previous.b_level) ^ "."  ^ b_content.b_previous.b_id ^
  "\nminer " ^ b_content.b_miner ^ 
  "\npow " ^ string_of_int b_content.b_pow ^
  "\ndate " ^ Util.Date.to_string b_content.b_date ^
  "\nnonce " ^ string_of_int b_content.b_nonce ^
  "\ntransactions \n"


let get_genesis =
  (* DONE *)
	let block_info = {
		b_level = -1 ;
		b_id = "---" ;
 	}
 in

 let block_content = {
  b_previous = block_info;
  b_miner = "God";
  b_pow = 0 ;
  b_date = Util.Date.of_string "Mon-Jun-12--11:02:03--+00-2000";
  b_nonce = 0;
  b_transactions = []
 }
in

 let block = {
  block_info = block_info;
  block_ctt = block_content
}in

{
  g_block = block;
  g_accounts =  [];
}



let check_chain_of_blocks b_list genesis =
  (* TODO *)
  assert false
