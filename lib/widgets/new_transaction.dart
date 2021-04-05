import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//Made this stateful because the textFirld state needed to be maintained
class NewTransaction extends StatefulWidget {
  final Function newTransactionHandler;

  NewTransaction(this.newTransactionHandler);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();
   DateTime _selectedDate;

  void _submitData() {
    final title = _titleController.text;
    final amount = double.parse(_amountController.text);
    if (title.isEmpty || amount <= 0 || title.isEmpty || _selectedDate==null) return;
    widget.newTransactionHandler(title, amount,_selectedDate);
    Navigator.of(context).pop();
  }

  void _openDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }
      setState(() {
         _selectedDate = value;
      });
     
    });
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
              controller: _titleController,
              onSubmitted: (_) {
                _submitData();
              },
            )),
        Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Amount'),
              controller: _amountController,
              onSubmitted: (_) {
                _submitData();
              },
            )),
        Container(
          height: 70,
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(child: Text(_selectedDate==null?'No date chosen!':'Date chosen: ${DateFormat.yMd().format(_selectedDate)}')),
              TextButton(
                  onPressed:_openDatePicker,
                  child: Text(
                    'Choose date',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 10),
          child: RaisedButton(
              elevation: 5,
              color: Theme.of(context).primaryColor,
              onPressed: _submitData,
              child: Text(
                'Add transaction',
                style: Theme.of(context).textTheme.button,
              )),
        )
      ],
    );
  }
}
