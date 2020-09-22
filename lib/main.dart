import 'package:amber_Hospital/auth_screens/login.dart';
import 'package:amber_Hospital/auth_screens/wrapper.dart';
import 'package:amber_Hospital/main_screens/ambulance.dart';
import 'package:amber_Hospital/main_screens/dapartment.dart';
import 'package:amber_Hospital/main_screens/home.dart';
import 'package:amber_Hospital/main_screens/doctor.dart';
import 'package:amber_Hospital/main_screens/notification.dart';
import 'package:amber_Hospital/main_screens/wards.dart';
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
            "Home": (context) => Home(),
            "Wrapper": (context) => Wrapper(),
            "Loading": (context) => Loading(),
            "Doctors": (context) => Doctor(),
            "Rooms": (context) => Room(),
            "Department": (context) => Department(),
            "Ambulance": (context) => Ambulance(),
            "Notification": (context) => Notifications()
          },
          home: Wrapper()),
    );
  }
}
