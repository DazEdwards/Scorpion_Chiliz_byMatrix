import 'package:flutter/material.dart';
import 'dart:typed_data';

import 'package:solana_web3/solana_web3.dart' as web3;
import 'package:solana_web3/programs.dart' show SystemProgram;
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solana_web3/solana_web3.dart';
import 'package:solana_web3/src/programs/system/program.dart';


class Solana {
  static final Solana _instance = Solana._internal();

  factory Solana() {
    return _instance;
  }

  Solana._internal();


  Future<void> makeTransaction(List<int> privateKey, String toPubkey,  double amount) async {
    try {
      // Create a connection to the devnet cluster.
      final cluster = web3.Cluster.devnet;
      final connection = web3.Connection(cluster);

      final Uint8List senderPrivateKey = Uint8List.fromList(privateKey);

      final Pubkey receiverPublicKey = Pubkey.fromBase58(toPubkey);


      // Create a new wallet to transfer tokens from.
      final wallet1 = web3.Keypair.fromSeckeySync(senderPrivateKey);
      final address1 = wallet1.pubkey;

      final Pubkey address2 = Pubkey.fromBase58(toPubkey);

      // Check the account balances before making the transfer.
      final balance = await connection.getBalance(wallet1.pubkey);
      print('Account $address1 has an initial balance of $balance lamports.');
      print('Account $address2 has an initial balance of 0 lamports.\n');

      // Fetch the latest blockhash.
      final BlockhashWithExpiryBlockHeight blockhash = await connection.getLatestBlockhash();

      // Create a System Program instruction to transfer 0.5 SOL from [address1] to [address2].
      final transaction = web3.Transaction.v0(
          payer: wallet1.pubkey,
          recentBlockhash: blockhash.blockhash,
          instructions: [
            SystemProgram.transfer(
              fromPubkey: address1,
              toPubkey: address2,
              lamports: web3.solToLamports(amount),
            ),
          ]
      );

      // Sign the transaction.
      transaction.sign([wallet1]);

      // Send the transaction to the cluster and wait for it to be confirmed.
      print('Send and confirm transaction...\n');
      await connection.sendAndConfirmTransaction(
        transaction,
      );

      // Check the updated account balances.
      final wallet1balance = await connection.getBalance(wallet1.pubkey);
      final wallet2balance = await connection.getBalance(receiverPublicKey);
      print('Account $address1 has an updated balance of $wallet1balance lamports.');
      print('Account $address2 has an updated balance of $wallet2balance lamports.');


    } catch (e) {
      rethrow;
    }
  }
}
