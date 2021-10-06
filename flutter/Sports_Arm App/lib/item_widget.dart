import 'package:flutter/material.dart';
// import 'package:sports_arm/HomeScreen.dart';
import 'package:sports_arm/acedemy_data.dart';

class ItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SportsARM"),
        backgroundColor: Colors.black87,
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.grey,
        child: Text(
          "IN DASHBOARD PAGE LONGPRESS ANY CARD TO DELETE IT.",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

List<Acedemy> acedemy = [
  Acedemy("Nike Football Club Dwarka", 87, 12, "Football", "Marco Reus",
      "BBPS,Plot-14,Sector-12,Dwarka,New Delhi"),
  Acedemy("Nike Basketball Club Janakpuri", 87, 12, "Basketball", "Marco Reus",
      "BBPS,Plot-14,Sector-12,Dwarka,New Delhi"),
];

_DashBoardState myState;

// ignore: must_be_immutable
class DashBoard extends StatefulWidget {
  DashBoard(this.set);
  Function set;
  @override
  _DashBoardState createState() {
    myState = _DashBoardState();
    return myState;
  }
}

class _DashBoardState extends State<DashBoard> {
  _set() {
    setState(() {});
    if (widget().set != null) {
      widget().set();
    }
  }

  bool _bool = false;

  void _setE(boole) {
    _bool = !_bool;
    setState(() {
      // _bool = !_bool;
    });
    print("qwerty === $_bool");
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DashBoard"),
        backgroundColor: Colors.black87,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
        alignment: Alignment.center,
        color: Colors.grey.shade200,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25.0),
                bottomRight: Radius.circular(25.0),
              ),
              child: ExpansionTile(
                backgroundColor: Colors.white,
                initiallyExpanded: _bool,
                onExpansionChanged: _setE,
                collapsedBackgroundColor: Colors.white,
                expandedAlignment: Alignment.center,
                title: _bool
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Contract",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Icon(Icons.keyboard_arrow_up)
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Sports Catagories",
                            style: TextStyle(color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                          Icon(Icons.keyboard_arrow_down_sharp)
                        ],
                      ),
                trailing: Text(""),
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black),
                            ),
                            onPressed: () {},
                            child: Text("All"),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                            ),
                            onPressed: () {},
                            child: Text(
                              "Basketball",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                            ),
                            onPressed: () {},
                            child: Text(
                              "Football",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                            ),
                            onPressed: () {},
                            child: Text(
                              "Tennis",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                            ),
                            onPressed: () {},
                            child: Text(
                              "Fencing",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                            ),
                            onPressed: () {},
                            child: Text(
                              "Swimming",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                            ),
                            onPressed: () {},
                            child: Text(
                              "Hockey",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                            ),
                            onPressed: () {},
                            child: Text(
                              "Karate",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: acedemy.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          contentPadding: EdgeInsets.only(left: 20),
                          title: Row(
                            children: [
                              Text(
                                acedemy[index].title,
                                style: TextStyle(fontSize: 20),
                              ),
                              GestureDetector(
                                child: Icon(Icons.delete_forever),
                                onTap: () {
                                  acedemy.removeAt(index);
                                  _set();
                                  setState(() {});
                                },
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Text(
                                        "${acedemy[index].players}",
                                        style: TextStyle(fontSize: 17),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text("Players"),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Text(
                                        "${acedemy[index].coaches}",
                                        style: TextStyle(fontSize: 17),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text("Coaches"),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      acedemy[index].game,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Center Head: ${acedemy[index].centerHead}",
                                style: TextStyle(fontSize: 13),
                              ),
                              Text(
                                "Location: ${acedemy[index].location}",
                                style: TextStyle(fontSize: 13),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
                padding: EdgeInsets.only(bottom: 60),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
