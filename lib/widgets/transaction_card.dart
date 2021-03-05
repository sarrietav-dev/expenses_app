import 'package:expenses_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final Function deleteTransaction;
  final Transaction transaction;

  TransactionCard({this.deleteTransaction, this.transaction});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(UniqueKey()),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      onDismissed: (direction) => deleteTransaction(transaction.id),
      child: Card(
        elevation: 3,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            child: Padding(
                padding: EdgeInsets.all(10),
                child: FittedBox(child: Text('\$${transaction.amount}'))),
          ),
          title: Text(
            transaction.title,
            style: Theme.of(context).textTheme.headline6,
          ),
          subtitle: Text(DateFormat.yMMMd().format(transaction.date)),
        ),
      ),
    );
  }
}
