import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionItems extends StatelessWidget {
  const TransactionItems({
    Key? key,
    // more about keys on diary
    required this.trans,
    required this.deleteTransaction,
  }) : super(key: key);
  // super passes info to main State 

  final Transaction trans;
  final Function deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: ListTile(
        // for more beautiful lists
        leading: CircleAvatar(
          radius: 35,
          child: Padding(
            padding: EdgeInsets.all(7),
            child: FittedBox(child: Text('Rs.${trans.amount}')),
          ),
        ),
        title: Text(
          '${trans.title}',
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(DateFormat.yMMMd().format(trans.date)),
        trailing: MediaQuery.of(context).size.width > 460
            // if more space is available then use some extra styling button with text beside it, if not use normal
            // IconButton
            ? FlatButton.icon(
                onPressed: () => deleteTransaction(trans.id),
                icon: Icon(Icons.delete),
                label: Text('Delete'),
                textColor: Theme.of(context).errorColor,
              )
            : IconButton(
                // for adding delete button to the side of the list
                icon: Icon(Icons.delete),
                onPressed: () => deleteTransaction(trans.id),
                color: Theme.of(context).errorColor,
              ),
      ),
    );
  }
}
