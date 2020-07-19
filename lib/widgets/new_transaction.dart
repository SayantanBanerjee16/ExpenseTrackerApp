import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {

  final Function addList ;
  NewTransaction(this.addList);

  final titleController = TextEditingController();
  final amountController = TextEditingController();

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
                    addList(titleController.text.toString(),
                        amountController.text.toString());
                  })
            ],
          ),
        ),
      ),
    );
  }
}
