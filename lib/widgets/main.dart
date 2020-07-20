import './new_transaction.dart';
import './transaction_list.dart';
import 'package:flutter/material.dart';
import '../model/Transaction.dart';
import './chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
        title: 'Flutter App',
        home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Transaction> items = [];

  List<Transaction> get _recentItems {
    return items.where((element) {
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  List<Transaction> get _reversedList {
    return items.reversed.toList();
  }

  void addList(String title, String amount) {
    setState(() {
      items.add(Transaction(
          id: DateTime.now().millisecondsSinceEpoch,
          title: title,
          amount: double.parse(amount),
          date: DateTime.now()));
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet<void>(
      context: context,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(addList),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
                _startAddNewTransaction(context);
            },
          )
        ],
      ),
      body: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10),
                  width: double.infinity,
                  child: Card(
                    color: Colors.red.shade50,
                    elevation: 6,
                    child: Center(
                      child: chart(_recentItems)
                    ),
                  ),
                ),
                TransactionList(_reversedList)
              ],
            ),
          ),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              _startAddNewTransaction(context);
            },
          )),
    );
  }
}
