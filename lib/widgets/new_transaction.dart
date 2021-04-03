

import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function newTransactionHandler;

  NewTransaction(this.newTransactionHandler);

  final titleController = TextEditingController();
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                  labelText: 'Title', border: OutlineInputBorder()),
              controller: titleController,
            )),
        Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Amount'),
              controller: amountController,
            )),
        Container(
          margin: EdgeInsets.only(right: 10),
          child: TextButton(
              onPressed: () {
                newTransactionHandler(
                    titleController.text, double.parse(amountController.text));
              },
              child: Text(
                'Add transaction',
                style: TextStyle(color: Colors.purple),
              )),
        )
      ],
    );
  }
}
