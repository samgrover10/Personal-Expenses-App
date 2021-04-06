import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;
  
  

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgColor;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final List<Color> bgs = const [Colors.black, Colors.blue, Colors.purple, Colors.orange];
    _bgColor = bgs[Random().nextInt(4)];
  }
  
  

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 10,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        child: ListTile(
            leading: CircleAvatar(
                radius: 30,
                backgroundColor: _bgColor,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: FittedBox(
                    child: Text(
                        '\$${widget.transaction.amount.toStringAsFixed(2)}'),
                  ),
                )),
            title: Text(
              widget.transaction.title,
              style: Theme.of(context).textTheme.title,
            ),
            subtitle: Text(DateFormat.yMMMMd().format(widget.transaction.date)),
            trailing: MediaQuery.of(context).size.width > 360
                ? TextButton.icon(
                    onPressed: () => widget.deleteTx(widget.transaction.id),
                    label: Text(
                      'Delete',
                      style: TextStyle(color: Theme.of(context).errorColor),
                    ),
                    icon: Icon(
                      Icons.delete,
                      color: Theme.of(context).errorColor,
                    ),
                  )
                : IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Theme.of(context).errorColor,
                    ),
                    onPressed: () => widget.deleteTx(widget.transaction.id),
                  )));
  }
}
