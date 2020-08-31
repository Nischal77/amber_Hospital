import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class Loading2 extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading2> {
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Color(0xff131111),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(height: 500, child: Image.asset("assets/logo.png")),
        SizedBox(height: 100),
        TypewriterAnimatedTextKit(
            speed: Duration(milliseconds: 1000),
            repeatForever: true,
            text: [". ", ". . ", ". . . ", ". . . . "],
            textStyle: TextStyle(
              fontSize: 30.0,
              color: Colors.white,
              decoration: TextDecoration.none,
              letterSpacing: 2,
            ),
            textAlign: TextAlign.start,
            alignment: AlignmentDirectional.topStart)
      ]),
    );
  }
}
