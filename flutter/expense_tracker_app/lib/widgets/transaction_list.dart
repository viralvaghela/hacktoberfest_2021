// transaction list manages the list of added items part

import 'package:flutter/material.dart';

import '../widgets/transaction_items.dart';
import '../models/transaction.dart';

class Transactionlist extends StatelessWidget {
  final List<Transaction> trans;
  final Function deleteTransaction;

  Transactionlist(this.trans, this.deleteTransaction);
  // to take the list from user_trans

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Container(
        /* SingleChildScrollView( */
        // to add scrolling to the list only too, u can also use ListView directly which is built in SingleChildScrollView with
        // a Column, but then you have to put it in a container and mention height that is available on the screen

        /* ListView( */
        // ListView renders all the items that are not even visible on the screen right now, so for long lists makes app slower

        height: constraints.maxHeight * 0.9,

        child: trans.isEmpty
            ? LayoutBuilder(
                builder: (ctx, constraints) {
                  // this constrainst takes a percentage of the parents dynamically defined height(we did it in main.dart file)
                  return Column(
                    children: <Widget>[
                      Text(
                        'No Item is added!',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Container(
                        margin: EdgeInsets.all(30),
                        height: constraints.maxHeight * 0.56,
                        // we gave the list 70% height of whole screen and here we set it to take 0.56% of that 70% for the img
                        child: Image.asset(
                          // you have to enable images in pubspec.yaml to use this
                          // asset is to use images from files in pc
                          'assets/images/waiting.png',
                          fit: BoxFit.cover,
                          // boxfit works only when its direct parent widget is giving it some area bound, but here its direct parent
                          // column is not giving any area bound so I have to put this Image in a container
                        ),
                      ),
                    ],
                  );
                },
              )
            : ListView.builder(
                // ListView.builder => doesnt render all the items of the list, only renders that are visible, so more optimized
                // and this doesnt take 'children:' also but using .builder required to use all these arguments down below

                itemBuilder: (context, index) {
                  // .builder takes this itemBuilder and a function inside with these arguments, index is the index of the items
                  // in the list and return everything u want

                  return TransactionItems(trans: trans[index], deleteTransaction: deleteTransaction);
                  // made a custom widget for more code readability

                  // OR,

                  /* Card(
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 3,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          child: Text(
                            'Rs. ${trans[index].amount.toStringAsFixed(2)}',
                            // toStringAsFixed(2) just keeps two values after point, and also rounds up the number
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.purple,
                            ),
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              trans[index].title,
    
                              style: Theme.of(context).textTheme.headline6,
    
                              // to use global font
                            ),
                            Container(
                              margin: EdgeInsets.all(5),
                              child: Text(
                                DateFormat.yMMMMd().format(trans[index].date),
                                // to use date like this add, intl to dependencies in pubspec.yaml file
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ); */
                },

                itemCount: trans.length,

                /* children: [
            ...trans.map((tx) {
              
            }).toList(), 
          ], */
                // children not used in ListView.builder anymore
              ),
      );
    });
  }
}


