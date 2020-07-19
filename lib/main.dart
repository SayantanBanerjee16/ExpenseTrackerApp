import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './model/Transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  List<Transaction> items;

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
                Container(
                  width: double.infinity,
                  child: Card(
                    margin: EdgeInsets.all(10),
                    elevation: 10,
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          TextField(
                            controller: titleController,
                            decoration: InputDecoration(
                              labelText: 'Enter Title',
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ),
                          TextField(
                            controller: amountController,
                            decoration: InputDecoration(
                              labelText: 'Enter Amount',
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ),
                          FlatButton(
                            onPressed: null,
                            color: Colors.blueAccent,
                            textColor: Colors.red,
                            child: Text('ADD TRANSACTION'),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                    child: Container(
                  margin: EdgeInsets.all(10),
                  child: Card(
                    elevation: 2,
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Rs. 12',
                              style: TextStyle(
                                  color: Colors.red,
                                  decorationStyle: TextDecorationStyle.wavy,
                                  decorationThickness: 4,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black,
                                  style: BorderStyle.solid,
                                  width: 3.0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(left : 10),
                                margin:  EdgeInsets.only(bottom : 5),
                                child: Text(
                                  'Title',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left : 10),
                                child: Text(
                                  DateTime.now().toString(),
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
