import 'package:flutter/material.dart';
import './transaction.dart';

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

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  final List<Transaction> transactions = [
    Transaction(
        id: '123', amount: 99.9, date: DateTime.now(), title: "New Shoes"),
    Transaction(id: '321', amount: 19.9, date: DateTime.now(), title: "Haircut")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
              child: Card(
            elevation: 20,
            color: Colors.blue,
            margin: EdgeInsets.all(20),
            child: Container(
              height: 200,
              width: 300,
              child: Center(
                  child: Text(
                "Chart",
                style: TextStyle(fontSize: 28, color: Colors.white),
              )),
            ),
          )),
          Column(
            children: transactions.map((tx) {
              return Card(
                child: Row(
                  
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple, width: 1)),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        tx.amount.toString(),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold,color: Colors.purple),
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                           Text(
                              tx.title,
                              style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                            ),
                         
                           Text(
                              tx.date.toString(),
                              style: TextStyle(fontSize: 14,color: Colors.grey),
                            ),
                          
                        ],
                      ),
                    )
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
