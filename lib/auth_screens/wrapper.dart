import 'package:amber_Hospital/auth_screens/welcome.dart';
import 'package:amber_Hospital/main_screens/main.dart';
import 'package:amber_Hospital/model/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    //check whether user is signed in or not and show either welcome screen or main screen
    if (user == null) {
      return Welcome();
    } else {
      return Main();
    }
  }
}