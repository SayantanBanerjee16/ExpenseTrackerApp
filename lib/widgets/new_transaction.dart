import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class NewTransaction extends StatefulWidget {

  final Function addList ;
  NewTransaction(this.addList);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void addItem(BuildContext context){
    String title = titleController.text.toString();
    String amount = amountController.text.toString();
    if(title.isEmpty || amount.isEmpty){
      Toast.show("All Field values should be provided!", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM, backgroundColor: Colors.blue.shade900, textColor: Colors.white);
      return;
    }else if(double.parse(amount) < 0){
      Toast.show("Amount can't be negative!", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM, backgroundColor: Colors.blue.shade900, textColor: Colors.white);
      return;
    }else{
      widget.addList(title,amount);
      Navigator.of(context).pop();
    }
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
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Enter Title',
                  contentPadding: EdgeInsets.all(10),
                ),
                onSubmitted: (_){
                  addItem(context);
                } ,
              ),
              TextField(
                controller: amountController,
                decoration: InputDecoration(
                  labelText: 'Enter Amount',
                  contentPadding: EdgeInsets.all(10),
                ),
                keyboardType: TextInputType.number,
                onSubmitted: (_){
                  addItem(context);
                } ,
              ),
              FlatButton(
                  child: Text('ADD TRANSACTION'),
                  textColor: Colors.red,
                  onPressed: () {
                    addItem(context);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
