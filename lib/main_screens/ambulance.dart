import 'package:flutter/material.dart';

class Ambulance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orangeAccent,
      width: MediaQuery.of(context).size.width * 0.87,
      height: MediaQuery.of(context).size.height,
    );
  }
}
