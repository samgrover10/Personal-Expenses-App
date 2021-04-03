import 'package:flutter/material.dart';
import 'package:personal_expenses_app/models/transaction.dart';
import 'package:personal_expenses_app/widgets/new_transaction.dart';
import 'package:personal_expenses_app/widgets/transacton_list.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> transactions = [
    Transaction(
        id: '123', amount: 99.9, date: DateTime.now(), title: "New Shoes"),
    Transaction(id: '321', amount: 19.9, date: DateTime.now(), title: "Haircut")
  ];

  void addNew(String title, double amount) {
    Transaction transaction = Transaction(
        id: 't3', amount: amount, date: DateTime.now(), title: title);
    setState(() {
      transactions.add(transaction);
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [NewTransaction(addNew), TransactionList(transactions)],
    );
  }
}
