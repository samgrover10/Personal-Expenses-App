import 'package:flutter/material.dart';
import 'package:personal_expenses_app/widgets/new_transaction.dart';
import 'package:personal_expenses_app/widgets/transacton_list.dart';


import 'models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Personal Expenses'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return NewTransaction(addNew);
        });
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: ()=>_startAddNewTransaction(context)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
                child: Card(
              elevation: 20,
              color: Colors.blue,
              margin: EdgeInsets.all(20),
              child: Container(
                height: 100,
                width: 300,
                child: Center(
                    child: Text(
                  "Chart",
                  style: TextStyle(fontSize: 28, color: Colors.white),
                )),
              ),
            )),
            TransactionList(transactions)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed:()=>_startAddNewTransaction(context),
      ),
    );
  }
}
