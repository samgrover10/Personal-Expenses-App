import 'package:flutter/material.dart';
import './transaction_item.dart';
import 'package:personal_expenses_app/models/transaction.dart';
import './no_trans_mess.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: transactions.isEmpty
            ? NoTransactionMessage()
            : ListView(
                children: transactions
                    .map((tx) => TransactionItem(
                        key: ValueKey(tx.id), transaction: tx, deleteTx: deleteTx))
                    .toList()));
  }
}
