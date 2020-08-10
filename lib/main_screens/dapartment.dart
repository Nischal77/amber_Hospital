import 'package:flutter/material.dart';

class Department extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      width: MediaQuery.of(context).size.width * 0.87,
      height: MediaQuery.of(context).size.height,
    );
  }
}
