import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function newTransactionHandler;

  NewTransaction(this.newTransactionHandler);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final title = titleController.text;
    final amount = double.parse(amountController.text);
    if (title.isEmpty || amount <= 0 || title.isEmpty) return;
    widget.newTransactionHandler(title, amount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  labelText: 'Title', border: OutlineInputBorder()),
              controller: titleController,
              onSubmitted: (_) {
                submitData();
              },
            )),
        Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Amount'),
              controller: amountController,
              onSubmitted: (_) {
                submitData();
              },
            )),
        Container(
          margin: EdgeInsets.only(right: 10),
          child: TextButton(
              onPressed: submitData,
              child: Text(
                'Add transaction',
                style: TextStyle(color: Colors.purple),
              )),
        )
      ],
    );
  }
}
