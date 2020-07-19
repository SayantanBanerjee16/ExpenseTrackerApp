import 'package:expense_app/widgets/user_transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Expense Tracker App'),
          backgroundColor: Colors.deepPurple,
        ),
        body: Scaffold(
          body: Center(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(20),
                  width: double.infinity,
                  child: Card(
                    elevation: 6,
                    child: Center(
                      child: Text('GRAPHS'),
                    ),
                  ),
                ),
               UserTransactions()
              ],
            ),
          ),
        ),
      ),
    );;
  }
}
