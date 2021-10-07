// Making prev app dynamic and readable using builder methods and custom widgets

import 'dart:io';
// to use Platfrom.isIOS/Platform.isAndroid

import 'package:flutter/cupertino.dart';
// to use IOS type widgets
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import './widgets/transaction_list.dart';
import '../models/transaction.dart';
import './widgets/new_transactions.dart';
import './widgets/chart.dart';

void main() {
  /* WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitUp]); */
  // by this you dont let the app rotate, it only stays in potrait up mode
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoApp(
            /* for IOS using if else I have to use CupertinoApp() and set everything accordingly in CupertinoThemeData */
            title: 'Expense Tracker',
            theme: CupertinoThemeData(
              primaryColor: Colors.purple,
              textTheme: CupertinoTextThemeData(
                primaryColor: Colors.purple,
                textStyle: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          )
        : MaterialApp(
            title: 'Expense Tracker',
            theme: ThemeData(
              // to set the overall theme of the app
              primarySwatch: Colors.purple,
              accentColor: Colors.amber,
              fontFamily: 'OpenSans',
              // to add this font include downloaded fonts in fonts folder and enable the font family in pubspec file and set font
              // family name there and specify location of the fonts
              appBarTheme: AppBarTheme(
                // to apply fonts to appBar only
                textTheme: ThemeData.light().textTheme.copyWith(
                      headline6: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 20,
                        // if I use MediaQuery here like this
                        /* fontsize: (mediaQuery.textScaleFactor * 20) */
                        // that means default fontSize is 20 but changing fontSize in phone setting will change the font size in app too
                        fontWeight: FontWeight.normal,
                      ),
                    ),
              ),
              textTheme: ThemeData.light().textTheme.copyWith(
                    // to set fontstyle for overall app
                    headline6: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
            ),
            home: MyHomePage(),
          );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  // WidgetsBindingObserver is used for checking app State
  final List<Transaction> _utransactions = [];

  bool _showChart = false;
  // for switch value

  // checking app state
  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    // !. => null check, if null then dont execute
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
    // printing app state
  }

  @override
  dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }
  // checking app state done

  List<Transaction> get _recentTransactions {
    return _utransactions.where((tx) {
      // where takes a func and search accordingly
      return tx.date.isAfter(
        // isAfter checks if tx.date is after a week or not, if before a week then dont take that element
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
    // to.List cause .where function doesnt return List<> it returns Iterable. so converting
  }
  // transaction list of a week to pass to show in the chart

  void _addTransaction(String txtitle, double amount, DateTime selectedDate) {
    final newTrans = Transaction(
      title: txtitle,
      amount: amount,
      id: DateTime.now().toString(),
      date: selectedDate,
    );

    setState(() {
      _utransactions.add(newTrans);
      // as _utransactions is final, but add() doesnt change the variable pointer '-utransactions' of the list but adds
      // something inside the list as the list is not final but the pointer variable '-utransactions' is
    });
  }

  void _deleteTransaction(String transId) {
    setState(() {
      _utransactions.removeWhere((index) => (index.id == transId));
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        // showModalBottomSheet makes the sheet that will pop up
        return NewTransaction(_addTransaction);
        // I've to call NewTransaction I have to make this stateful widget now, so I dont need user_transaction file
        // anymore cause I will manage it here

        // In new flutter touching on popped up sheet wont hide it again, but in old flutter it was, so manual setting was needed
        // to change it, like this -
        /* return GestureDetector(
        onTap() {},
        child : NewTransaction(_addTransaction),
        behaviour: HitTestBehaviour.opaque,
      ) */
      },
    );
  }

  List<Widget> _isLandscape(
      // sending a list of widgets cause more than one widget present
      MediaQueryData mediaQuery,
      AppBar appBar,
      Widget txList) {
    return [
      Row(
        // creating a switch for potrait down mode as screen cant hold everything
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Show Chart'),
          Switch.adaptive(
            // .adaptive actually forms the button according to the device OS. if android it creates an android type
            // button if in ios it creates an IOS types button
            value: _showChart,
            // shows its on or off with _showChart true or false
            onChanged: (val) {
              setState(() {
                _showChart = val;
              });
            },
          ),
        ],
      ),
      // check button on or off and show accordingly
      _showChart
          // if else cond., so if button on(_showChart==true) show chart only if off(_showChart==false) show list only
          ? Container(
              height: ((mediaQuery.size.height -
                      appBar.preferredSize.height -
                      mediaQuery.padding.top) *
                  0.7),
              child: Chart(_recentTransactions),
            )
          :
          // MediaQuery takes height for different phone sizes
          //subtracting appbar height and status bar height and * 0.7 means of full screen give this container
          // 70% => though 70% also leaves some space so I am increasing the ChartBar sizes as it will look better

          /* Container(
              width: double.infinity,
              margin: EdgeInsets.all(5),
              child: Card(
                // card takes size as much its child requires, so to give it custom size wrap Card/Text in Container widget

                color: Theme.of(context).accentColor,
                // colors according to the overall theme I set
                child: Text('CHART!'),
                elevation: 5,
                shadowColor: Colors.lightBlue[400],
              ),
            ), */
          // chart is designed in a customly in other file

          txList,
    ];
  }

  List<Widget> _isPortrait(
      MediaQueryData mediaQuery, AppBar appBar, Widget txList) {
    return [
      Container(
        height: ((mediaQuery.size.height -
                appBar.preferredSize.height -
                mediaQuery.padding.top) *
            0.3),
        child: Chart(_recentTransactions),
      ),
      txList
    ];
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    // setting it here so I dont have to type it again and again
    final isLandScaped = mediaQuery.orientation == Orientation.landscape;
    // to check phone is in landscape mode or in portrait

    final dynamic appBar = Platform.isIOS
        // dynamic appBar cause in cupertino navigationbar(IOS) takes ObstructingPreferedSizeWidget but material appbar(android)
        // takes only preferedSizeWidget so setting it to dynamic manages it accordingly
        ? CupertinoNavigationBar(
            // NavBar for IOS
            middle: const Text('Expense Tracker'),
            // const widget means, this widget never changes so no need to rebuild it when calling build method, before
            // publishing app make sure to add const widgets/constructors wherever possible that will improve the app
            // performance a little bit.
            trailing: Row(
              children: [
                CupertinoButton(
                  // IconButton in Cupertino widget
                  onPressed: () => _startAddNewTransaction(context),
                  child: Icon(CupertinoIcons.add),
                ),
              ],
            ),
          )
        : AppBar(
            // NavBar for Android
            title: Text('Expense Tracker'),
            actions: <Widget>[
              IconButton(
                  onPressed: () => _startAddNewTransaction(context),
                  icon: Icon(Icons.add)),
              // buttons with various icons
            ],
          );

    final txList = Container(
        height: ((mediaQuery.size.height -
                appBar.preferredSize.height -
                mediaQuery.padding.top) *
            0.7),
        child: Transactionlist(_utransactions, _deleteTransaction));

    final pageBody = SafeArea(
      // SafeArea is for IOS devices to leave spaces in top and bottom for phone bars and switches
      child: SingleChildScrollView(
        // adds scrolling feature to the full screen

        child: Column(
          /* mainAxisAlignment: MainAxisAlignment.center, */
          // to position the Cards, => vertical is mainAxis for coloumn and horizontal for Row widget

          /* crossAxisAlignment: CrossAxisAlignment.stretch, */
          //horizontal position setup

          children: <Widget>[
            if (isLandScaped)
              // checking if in landscape mode then show the button
              ..._isLandscape(mediaQuery, appBar, txList),
            // putting code in function for more readability
            // using ... cause builder sending list of widgets so cant accept that, so extracting the list and just
            // taking the widgets and putting in Coloumn

            if (!isLandScaped)
              // if not in landscape mode show small chart and show the chart too
              ..._isPortrait(mediaQuery, appBar, txList),
          ],
        ),
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: pageBody,
            navigationBar: appBar,
          )
        : Scaffold(
            appBar: appBar,
            // using it from a variable so that we can access appBar height and all from all over the code
            body: pageBody,

            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Platform.isIOS
                // checks platform
                ? Container()
                : FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () => _startAddNewTransaction(context),
                    // this button takes color acccording to the theme accentColor
                  ),
          );
  }
}
