import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/Transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> items;

  TransactionList(this.items);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
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
                elevation: 4,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: FittedBox(
                        child: Text(
                          '₹ ${item.amount}',
                          style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    '${item.title}',
                    style: Theme.of(context).textTheme.title,
                  ),
                  subtitle: Text(
                    '${DateFormat.yMMMd().format(item.date)}',
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                  trailing:
                      IconButton(icon: Icon(Icons.delete), onPressed: () {}),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
