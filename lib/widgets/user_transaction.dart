import 'package:flutter/material.dart';
import 'package:expense_app/widgets/new_transaction.dart';
import 'package:expense_app/widgets/transaction_list.dart';
import '../model/Transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {

  final List<Transaction> items = [];

  void addList(String title, String amount) {
    setState(() {
      items.add(Transaction(
          id: DateTime.now().millisecondsSinceEpoch,
          title: title,
          amount: double.parse(amount),
          date: DateTime.now()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(addList),
        TransactionList(items)
      ],
    );
  }
}
