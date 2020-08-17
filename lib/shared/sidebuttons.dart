import 'package:flutter/material.dart';

class Sidebuttons extends StatefulWidget {
  const Sidebuttons({this.onIconPress});
  final IconCallBack onIconPress;

  @override
  _SidebuttonsState createState() => _SidebuttonsState();
}

class _SidebuttonsState extends State<Sidebuttons> {
  @override
  Widget build(BuildContext context) {
    List<double> width = [
      MediaQuery.of(context).size.width * 0.09,
      MediaQuery.of(context).size.width * 0.09,
      MediaQuery.of(context).size.width * 0.09,
      MediaQuery.of(context).size.width * 0.09,
      MediaQuery.of(context).size.width * 0.09
    ];
    return Container(
      color: Colors.grey[350],
      width: MediaQuery.of(context).size.width * 0.13,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () => widget.onIconPress(5),
            child: AnimatedContainer(
                margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                duration: Duration(milliseconds: 200),
                curve: Curves.fastOutSlowIn,
                width: width[4],
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.grey[600],
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(color: Colors.grey, offset: Offset(2, 2)),
                    ]),
                child: Image.asset(
                  "home.png",
                )),
          ),
          InkWell(
            onTap: () {
              setState(() {
                widget.onIconPress(0);
                width[0] = MediaQuery.of(context).size.width * 0.1;
              });
            },
            child: AnimatedContainer(
                margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                duration: Duration(milliseconds: 350),
                curve: Curves.fastOutSlowIn,
                width: width[0],
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(color: Colors.grey, offset: Offset(2, 2)),
                    ]),
                child: Image.asset(
                  "doctor.png",
                )),
          ),
          InkWell(
            onTap: () => widget.onIconPress(1),
            child: AnimatedContainer(
                margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                duration: Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
                width: width[1],
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.amberAccent,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(color: Colors.grey, offset: Offset(2, 2)),
                    ]),
                child: Image.asset(
                  "hospital.png",
                )),
          ),
          InkWell(
            onTap: () => widget.onIconPress(2),
            child: AnimatedContainer(
                margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                duration: Duration(milliseconds: 650),
                curve: Curves.fastOutSlowIn,
                width: width[2],
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(color: Colors.grey, offset: Offset(2, 2)),
                    ]),
                child: Image.asset(
                  "rooms.png",
                )),
          ),
          InkWell(
            onTap: () => widget.onIconPress(3),
            child: AnimatedContainer(
                margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                duration: Duration(milliseconds: 800),
                curve: Curves.fastOutSlowIn,
                width: width[3],
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(color: Colors.grey, offset: Offset(2, 2)),
                    ]),
                child: Image.asset(
                  "ambulance.png",
                )),
          ),
          InkWell(
            onTap: () => widget.onIconPress(4),
            child: AnimatedContainer(
                margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                duration: Duration(milliseconds: 950),
                curve: Curves.fastOutSlowIn,
                width: width[4],
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(color: Colors.grey, offset: Offset(2, 2)),
                    ]),
                child: Image.asset(
                  "notification.png",
                )),
          ),
        ],
      ),
    );
  }
}

typedef IconCallBack = void Function(int icon);
