import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/Transaction.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> items ;
  TransactionList(this.items);


  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
