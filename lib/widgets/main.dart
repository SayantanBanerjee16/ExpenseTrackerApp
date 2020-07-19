import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../model/Transaction.dart';
import 'package:intl/intl.dart';

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

  final List<Transaction> items = [];

  void addList(String title, String amount) {
    items.add(Transaction(
        id: DateTime.now().millisecondsSinceEpoch,
        title: title,
        amount: double.parse(amount),
        date: DateTime.now()));
  }

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
                              child: Text('ADD TRANSACTION'),
                              textColor: Colors.red,
                              onPressed: () {
                                setState(() {
                                  addList(titleController.text.toString(),
                                      amountController.text.toString());
                                });
                              })
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height : 500,
                  child: Center(
                    child: ListView.builder(
                      // Let the ListView know how many items it needs to build.
                      itemCount: items.length,
                      // Provide a builder function. This is where the magic happens.
                      // Convert each item into a widget based on the type of item it is.
                      itemBuilder: (context, index) {
                        final item = items[index];

                        return Container(
                          margin: EdgeInsets.all(5),
                          child: Card(
                            elevation: 2,
                            child: Container(
                              padding: EdgeInsets.all(15),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      'Rs. ' + item.amount.toString(),
                                      style: TextStyle(
                                          color: Colors.red,
                                          decorationStyle:
                                          TextDecorationStyle.wavy,
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
                                      Center(
                                        child: Container(
                                          padding: EdgeInsets.only(left: 10),
                                          margin: EdgeInsets.only(bottom: 5),
                                          child: Text(
                                            item.title.toString(),
                                            style: TextStyle(
                                                color: Colors.blue.shade900,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          DateFormat.yMMMd().format(item.date),
                                          style: TextStyle(
                                              color: Colors.blue.shade400,
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
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
