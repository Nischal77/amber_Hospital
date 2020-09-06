import 'package:flutter/material.dart';

class Sidebuttons extends StatefulWidget {
  const Sidebuttons({this.onIconPress});
  final IconCallBack onIconPress;

  @override
  _SidebuttonsState createState() => _SidebuttonsState();
}

class _SidebuttonsState extends State<Sidebuttons> {
  List<double> width = [0.09, 0.09, 0.09, 0.09, 0.09, 0.18];
  List<BorderRadius> borderRadius = [
    BorderRadius.all(Radius.circular(30)),
    BorderRadius.all(Radius.circular(30)),
    BorderRadius.all(Radius.circular(30)),
    BorderRadius.all(Radius.circular(30)),
    BorderRadius.all(Radius.circular(30)),
    BorderRadius.horizontal(left: Radius.circular(30))
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[400],
      width: MediaQuery.of(context).size.width * 0.13,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                widget.onIconPress(5);
                width[0] = 0.09;
                width[1] = 0.09;
                width[2] = 0.09;
                width[3] = 0.09;
                width[4] = 0.09;
                width[5] = 0.18;
                borderRadius[0] = BorderRadius.all(Radius.circular(30));
                borderRadius[1] = BorderRadius.all(Radius.circular(30));
                borderRadius[2] = BorderRadius.all(Radius.circular(30));
                borderRadius[3] = BorderRadius.all(Radius.circular(30));
                borderRadius[4] = BorderRadius.all(Radius.circular(30));
                borderRadius[5] =
                    BorderRadius.horizontal(left: Radius.circular(30));
              });
            },
            child: AnimatedContainer(
                margin: EdgeInsets.fromLTRB(8, 4, 0, 4),
                duration: Duration(milliseconds: 200),
                curve: Curves.fastOutSlowIn,
                width: MediaQuery.of(context).size.width * width[5],
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.grey[600],
                    borderRadius: borderRadius[5],
                    boxShadow: [
                      BoxShadow(color: Colors.grey, offset: Offset(2, 2)),
                    ]),
                child: Row(children: [
                  Image.asset(
                    "assets/home.png",
                  ),
                  Expanded(
                      child: Text(
                    "Home",
                    style: TextStyle(color: Colors.white),
                  ))
                ])),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                widget.onIconPress(1);
                width[0] = 0.09;
                width[1] = 0.18;
                width[2] = 0.09;
                width[3] = 0.09;
                width[4] = 0.09;
                width[5] = 0.09;
                borderRadius[0] =
                    BorderRadius.horizontal(left: Radius.circular(30));
                borderRadius[1] = BorderRadius.all(Radius.circular(30));
                borderRadius[2] = BorderRadius.all(Radius.circular(30));
                borderRadius[3] = BorderRadius.all(Radius.circular(30));
                borderRadius[4] = BorderRadius.all(Radius.circular(30));
                borderRadius[5] = BorderRadius.all(Radius.circular(30));
              });
            },
            child: AnimatedContainer(
                margin: EdgeInsets.fromLTRB(8, 4, 0, 4),
                duration: Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
                width: MediaQuery.of(context).size.width * width[1],
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.amberAccent,
                    borderRadius: borderRadius[0],
                    boxShadow: [
                      BoxShadow(color: Colors.grey, offset: Offset(2, 2)),
                    ]),
                child: Row(children: [
                  Image.asset(
                    "assets/hospital.png",
                  ),
                  Expanded(
                      child: Text(
                    "Departments",
                    style: TextStyle(color: Colors.white),
                  ))
                ])),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                setState(() {
                  widget.onIconPress(0);
                  width[0] = 0.18;
                  width[1] = 0.09;
                  width[2] = 0.09;
                  width[3] = 0.09;
                  width[4] = 0.09;
                  width[5] = 0.09;
                  borderRadius[0] = BorderRadius.all(Radius.circular(30));
                  borderRadius[1] =
                      BorderRadius.horizontal(left: Radius.circular(30));
                  borderRadius[2] = BorderRadius.all(Radius.circular(30));
                  borderRadius[3] = BorderRadius.all(Radius.circular(30));
                  borderRadius[4] = BorderRadius.all(Radius.circular(30));
                  borderRadius[5] = BorderRadius.all(Radius.circular(30));
                });
              });
            },
            child: AnimatedContainer(
                margin: EdgeInsets.fromLTRB(8, 4, 0, 4),
                duration: Duration(milliseconds: 350),
                curve: Curves.fastOutSlowIn,
                width: MediaQuery.of(context).size.width * width[0],
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: borderRadius[1],
                    boxShadow: [
                      BoxShadow(color: Colors.grey, offset: Offset(2, 2)),
                    ]),
                child: Row(children: [
                  Image.asset(
                    "assets/doctor.png",
                  ),
                  Expanded(
                      child: Text(
                    "Doctors",
                    style: TextStyle(color: Colors.white),
                  ))
                ])),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                widget.onIconPress(2);
                width[0] = 0.09;
                width[1] = 0.09;
                width[2] = 0.18;
                width[3] = 0.09;
                width[4] = 0.09;
                width[5] = 0.09;
                borderRadius[0] = BorderRadius.all(Radius.circular(30));
                borderRadius[1] = BorderRadius.all(Radius.circular(30));
                borderRadius[2] =
                    BorderRadius.horizontal(left: Radius.circular(30));
                borderRadius[3] = BorderRadius.all(Radius.circular(30));
                borderRadius[4] = BorderRadius.all(Radius.circular(30));
                borderRadius[5] = BorderRadius.all(Radius.circular(30));
              });
            },
            child: AnimatedContainer(
                margin: EdgeInsets.fromLTRB(8, 4, 0, 4),
                duration: Duration(milliseconds: 650),
                curve: Curves.fastOutSlowIn,
                width: MediaQuery.of(context).size.width * width[2],
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: borderRadius[2],
                    boxShadow: [
                      BoxShadow(color: Colors.grey, offset: Offset(2, 2)),
                    ]),
                child: Row(children: [
                  Image.asset(
                    "assets/rooms.png",
                  ),
                  Expanded(
                      child: Text(
                    "Wards",
                    style: TextStyle(color: Colors.white),
                  ))
                ])),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                widget.onIconPress(3);
                width[0] = 0.09;
                width[1] = 0.09;
                width[2] = 0.09;
                width[3] = 0.18;
                width[4] = 0.09;
                width[5] = 0.09;
                borderRadius[0] = BorderRadius.all(Radius.circular(30));
                borderRadius[1] = BorderRadius.all(Radius.circular(30));
                borderRadius[2] = BorderRadius.all(Radius.circular(30));
                borderRadius[3] =
                    BorderRadius.horizontal(left: Radius.circular(30));
                borderRadius[4] = BorderRadius.all(Radius.circular(30));
                borderRadius[5] = BorderRadius.all(Radius.circular(30));
              });
            },
            child: AnimatedContainer(
                margin: EdgeInsets.fromLTRB(8, 4, 0, 4),
                duration: Duration(milliseconds: 800),
                curve: Curves.fastOutSlowIn,
                width: MediaQuery.of(context).size.width * width[3],
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: borderRadius[3],
                    boxShadow: [
                      BoxShadow(color: Colors.grey, offset: Offset(2, 2)),
                    ]),
                child: Row(children: [
                  Image.asset(
                    "assets/ambulance.png",
                  ),
                  Expanded(
                      child: Text(
                    "Ambulance",
                    style: TextStyle(color: Colors.white),
                  ))
                ])),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                widget.onIconPress(4);
                width[0] = 0.09;
                width[1] = 0.09;
                width[2] = 0.09;
                width[3] = 0.09;
                width[4] = 0.18;
                width[5] = 0.09;
                borderRadius[0] = BorderRadius.all(Radius.circular(30));
                borderRadius[1] = BorderRadius.all(Radius.circular(30));
                borderRadius[2] = BorderRadius.all(Radius.circular(30));
                borderRadius[3] = BorderRadius.all(Radius.circular(30));
                borderRadius[4] =
                    BorderRadius.horizontal(left: Radius.circular(30));
                borderRadius[5] = BorderRadius.all(Radius.circular(30));
              });
            },
            child: AnimatedContainer(
                margin: EdgeInsets.fromLTRB(8, 4, 0, 4),
                duration: Duration(milliseconds: 950),
                curve: Curves.fastOutSlowIn,
                width: MediaQuery.of(context).size.width * width[4],
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: borderRadius[4],
                    boxShadow: [
                      BoxShadow(color: Colors.grey, offset: Offset(2, 2)),
                    ]),
                child: Row(children: [
                  Image.asset(
                    "assets/notification.png",
                  ),
                  Expanded(
                      child: Text(
                    "Notification",
                    style: TextStyle(color: Colors.white),
                  ))
                ])),
          ),
        ],
      ),
    );
  }
}

typedef IconCallBack = void Function(int icon);
