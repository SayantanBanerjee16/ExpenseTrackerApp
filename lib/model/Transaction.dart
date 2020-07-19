import 'package:flutter/material.dart';

class Transaction {
  int id;
  String title;
  double amount;
  DateTime date;

  Transaction({@required this.id, @required this.title, @required this.amount, this.date});
}
