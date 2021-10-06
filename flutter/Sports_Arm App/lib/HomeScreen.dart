import 'package:flutter/material.dart';
import 'package:sports_arm/form.dart';
import 'package:sports_arm/item_widget.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  PageController pageController;
  Widget _myWidget;
  _set() {
    _myWidget =
        acedemy.length > 1 ? FloatingButton(_set) : FloatingButton2(_set);
    setState(() {});
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      pageController.animateToPage(
        index,
        duration: Duration(
          milliseconds: 200,
        ),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              child: SafeArea(
                child: PageView(
                    controller: pageController,
                    children: <Widget>[
                      DashBoard(_set),
                      ItemWidget(),
                      ItemWidget(),
                      ItemWidget()
                    ],
                    onPageChanged: (int index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    }),
              ),
            ),
            Column(
              children: [
                Spacer(),
                Row(
                  children: [
                    Spacer(),
                    AnimatedSwitcher(
                      transitionBuilder: (child, animation) => ScaleTransition(
                        alignment: Alignment.bottomLeft,
                        child: child,
                        scale: animation,
                      ),
                      duration: Duration(milliseconds: 500),
                      child: acedemy.length > 1
                          ? _myWidget = FloatingButton(_set)
                          : _myWidget = FloatingButton2(_set),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                BNB(_onTabTapped,
                    _currentIndex), // Bottom Navigation Bar External Method
              ],
            ),
            Container(
                child: Card(
              color: Colors.blue,
            )),
          ],
        ),
      ),
    );
  }
}

class AcedemyButton extends StatelessWidget {
  AcedemyButton({@required this.onPressed});
  final GestureTapCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Row(
        children: [
          Icon(
            Icons.add,
          ),
          Text(
            "Add New Academy",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class FloatingButton extends StatefulWidget {
  FloatingButton(this.s);
  final Function s;
  @override
  _FloatingButtonState createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.black,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Forms(widget().s),
          ),
        );
      },
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}

class FloatingButton2 extends StatefulWidget {
  FloatingButton2(this.s);
  final Function s;
  @override
  _FloatingButton2State createState() => _FloatingButton2State();
}

class _FloatingButton2State extends State<FloatingButton2> {
  @override
  Widget build(BuildContext context) {
    return AcedemyButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Forms(widget().s),
          ),
        );
      },
    );
  }
}

BottomNavigationBarItem item(Icon icon, String str) {
  return BottomNavigationBarItem(
    icon: icon,
    label: str,
  );
}

class BNB extends StatefulWidget {
  final Function onTabTapped;
  final int _currentIndex;
  BNB(this.onTabTapped, this._currentIndex);
  @override
  _BNBState createState() => _BNBState();
}

class _BNBState extends State<BNB> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25.0),
        topRight: Radius.circular(25.0),
      ),
      child: BottomNavigationBar(
        selectedItemColor: Colors.black,
        selectedIconTheme: IconThemeData(color: Colors.black),
        unselectedIconTheme: IconThemeData(color: Colors.black),
        onTap: widget().onTabTapped,
        currentIndex: widget()._currentIndex,
        items: [
          item(
            Icon(
              Icons.home_outlined,
            ),
            "Dashboard",
          ),
          item(
            Icon(
              Icons.sports_outlined,
            ),
            "Coaching Staff",
          ),
          item(
            Icon(
              Icons.add_alert_outlined,
            ),
            "Notification",
          ),
          item(
            Icon(
              Icons.account_box_outlined,
            ),
            "Profile",
          ),
        ],
        elevation: 10,
        iconSize: 35,
      ),
    );
  }
}
