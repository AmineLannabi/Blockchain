(******************************************************************************)
(*     Copyright (C) OCamlPro SAS                                             *)
(******************************************************************************)

open Types
open Helpers

let main () =

	let rec get_previous_block_info blocks = 
  (* Get the previous block id *)
	match blocks with 
		|[] -> failwith "Cannot be called on an empty database"
		|[s] -> s
		|_::t -> get_previous_block_info t
		
	in
	let blockchain = ref (empty_blockchain get_genesis) 
	in

	while  (List.length !blockchain.db.blocks) < 5 do
		print_string("Mining...\n") ;
		let nonce = Random.int((int_of_float (2.**29.)))
		in
		let block_ctt = mk_block_content (Options.miner) [] (get_previous_block_info !blockchain.db.blocks) nonce pow_challenge
		in
		let level = List.length !blockchain.db.blocks
		in
		let block_string = block_content_to_string block_ctt
		in
		let hash =  (hash_string block_string)
		in 
		let is_valid = sufficient_pow (pow_challenge) hash
		in
		if is_valid then
			let block_inf = {b_level = level ; b_id = hash}
			in 
			let new_block = {block_info =block_inf ; block_ctt =block_ctt }
			in
			blockchain := {!blockchain with db = {!blockchain.db with  blocks = List.append !blockchain.db.blocks [new_block] } } ;
			print_string("The following block had been added to the blockchain : \n*********************************\n") ;
			print_string(block_content_to_string new_block.block_ctt );
			print_string("*********************************\n\n")
		done ;
		print_string("//////// BlockChain ////////\n") ;
		List.iter (fun block ->print_string((String.make 20 '*')^"\n"^ (block_content_to_string block.block_ctt) ^(String.make 20 '*')^"\n")) !blockchain.db.blocks 
		 
	
		
	

