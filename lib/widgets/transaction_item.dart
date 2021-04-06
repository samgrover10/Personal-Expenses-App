import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 10,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        child: ListTile(
            leading: CircleAvatar(
                radius: 30,
                backgroundColor: Theme.of(context).primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: FittedBox(
                    child: Text(
                        '\$${transaction.amount.toStringAsFixed(2)}'),
                  ),
                )),
            title: Text(
              transaction.title,
              style: Theme.of(context).textTheme.title,
            ),
            subtitle: Text(DateFormat.yMMMMd()
                .format(transaction.date)),
            trailing: MediaQuery.of(context).size.width > 360
                ? TextButton.icon(
                    onPressed: () =>
                        deleteTx(transaction.id),
                    label: Text('Delete',style: TextStyle(color: Theme.of(context).errorColor),),
                    icon:  Icon(
                      Icons.delete,
                      color: Theme.of(context).errorColor,
                    ),
                  )
                : IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Theme.of(context).errorColor,
                    ),
                    onPressed: () =>
                        deleteTx(transaction.id),
                  )));
  }
}
