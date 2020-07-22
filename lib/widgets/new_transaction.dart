import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function _addItem;

  NewTransaction(this._addItem);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  DateTime _selectedDate;

  void _addItem(BuildContext context) {
    String title = _titleController.text.toString();
    String amount = _amountController.text.toString();
    if (title.isEmpty || amount.isEmpty || _selectedDate == null) {
      Toast.show("All Field values should be provided!", context,
          duration: Toast.LENGTH_LONG,
          gravity: Toast.BOTTOM,
          backgroundColor: Colors.blue.shade900,
          textColor: Colors.white);
      return;
    } else if (double.parse(amount) < 0) {
      Toast.show("Amount can't be negative!", context,
          duration: Toast.LENGTH_LONG,
          gravity: Toast.BOTTOM,
          backgroundColor: Colors.blue.shade900,
          textColor: Colors.white);
      return;
    } else {
      widget._addItem(title, amount, _selectedDate);
      Navigator.of(context).pop();
    }
  }

  void _DatePicker(BuildContext ctx) {
    showDatePicker(
        context: ctx,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime.now()).then((pickedDate) {
          if(pickedDate != null){
            setState(() {
              _selectedDate = pickedDate;
            });
          }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        margin: EdgeInsets.all(10),
        elevation: 10,
        child: Center(
          child: Column(
            children: <Widget>[
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Enter Title',
                  contentPadding: EdgeInsets.all(10),
                ),
                onSubmitted: (_) {
                  _addItem(context);
                },
              ),
              TextField(
                controller: _amountController,
                decoration: InputDecoration(
                  labelText: 'Enter Amount',
                  contentPadding: EdgeInsets.all(10),
                ),
                keyboardType: TextInputType.number,
                onSubmitted: (_) {
                  _addItem(context);
                },
              ),
              Container(
                height: 70,
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    Text(_selectedDate == null ? 'No date choosen!' : 'Picked date : ${DateFormat.yMMMd().format(_selectedDate)}'),
                    FlatButton(
                      onPressed: () {
                        _DatePicker(context);
                      },
                      child: Text(
                        'Choose Date',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade800,
                            fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 20),
                alignment: Alignment.centerRight,
                child: RaisedButton(
                    color: Colors.purple,
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'ADD TRANSACTION',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      _addItem(context);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
