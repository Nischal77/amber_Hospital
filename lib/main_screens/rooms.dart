import 'package:flutter/material.dart';

class Room extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "room",
      child: Container(
        color: Colors.amberAccent,
        width: MediaQuery.of(context).size.width * 0.87,
        height: MediaQuery.of(context).size.height,
      ),
    );
  }
}
