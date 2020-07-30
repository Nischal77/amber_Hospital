import 'package:amber_Hospital/auth_screens/login.dart';
import 'package:amber_Hospital/auth_screens/wrapper.dart';
import 'package:amber_Hospital/main_screens/ambulancelist.dart';
import 'package:amber_Hospital/main_screens/main.dart';
import 'package:amber_Hospital/services/auth_service.dart';
import 'package:amber_Hospital/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:amber_Hospital/auth_screens/welcome.dart';
import 'package:provider/provider.dart';
import 'package:amber_Hospital/model/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            "Welcome": (context) => Welcome(),
            "Login": (context) => Login(),
            "AmbulanceList": (context) => AList(),
            "Wrapper": (context) => Wrapper(),
            "Loading": (context) => Loading(),
            "Main": (context) => Main()
          },
          home: Loading()),
    );
  }
}
