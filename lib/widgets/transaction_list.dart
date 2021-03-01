import 'package:expenses_app/models/transaction.dart';
import 'package:expenses_app/widgets/transaction_card.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;
  final Function _deleteTransaction;

  TransactionList(this._userTransactions, this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .6,
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
                        return TransactionCard(
                          transaction: _userTransactions[index],
                          deleteTransaction: _deleteTransaction,
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
