import 'package:expenses_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;
  final Function _deleteTransaction;

  TransactionList(this._userTransactions, this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: _userTransactions.isEmpty
          ? Column(
              children: [
                Text(
                  "No transactions added yet!",
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 60,
                ),
                Container(
                  height: 400,
                  child: Image.asset(
                    "assets/images/waiting.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : Column(
              children: [
                Expanded(
                  flex: 7,
                  child: Container(
                    height: 500,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: UniqueKey(),
                          background: Container(
                            color: Theme.of(context).errorColor,
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                          onDismissed: (direction) =>
                              _deleteTransaction(_userTransactions[index].id),
                          child: Card(
                            elevation: 3,
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 30,
                                child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: FittedBox(
                                        child: Text(
                                            '\$${_userTransactions[index].amount}'))),
                              ),
                              title: Text(
                                _userTransactions[index].title,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              subtitle: Text(DateFormat.yMMMd()
                                  .format(_userTransactions[index].date)),
                            ),
                          ),
                        );
                      },
                      itemCount: _userTransactions.length,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    "Swipe to delete",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                )
              ],
            ),
    );
  }
}
