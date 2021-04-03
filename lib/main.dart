import 'package:flutter/material.dart';
import 'package:personal_expenses_app/widgets/user_transactions.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
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
            UserTransaction()
          ],
        ),
      ),
    );
  }
}
