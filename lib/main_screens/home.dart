import 'package:amber_Hospital/Forms/ambulance.dart';
import 'package:amber_Hospital/Forms/depart.dart';
import 'package:amber_Hospital/Forms/doctor.dart';
import 'package:amber_Hospital/Forms/ward.dart';
import 'package:amber_Hospital/main_screens/ambulance.dart';
import 'package:amber_Hospital/main_screens/dapartment.dart';
import 'package:amber_Hospital/main_screens/doctor.dart';
import 'package:amber_Hospital/main_screens/hospital.dart';
import 'package:amber_Hospital/main_screens/notification.dart';
import 'package:amber_Hospital/main_screens/wards.dart';
import 'package:flutter/material.dart';
import 'package:amber_Hospital/shared/sidebuttons.dart';
import 'package:amber_Hospital/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:amber_Hospital/model/user.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  int displayScreen = 5;
  bool fbutton(int check) {
    if (check == 5)
      return true;
    else if (check == 4)
      return true;
    else
      return false;
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(height: 60, child: Image.asset("assets/logo.png")),
        centerTitle: true,
        actions: [
          FlatButton.icon(
              onPressed: () async {
                //if user is not null signout or else pop and go to welcome screen
                if (user == null) {
                  Navigator.popAndPushNamed(context, "Welcome");
                } else
                  await _auth.signOut();
              },
              icon: Icon(Icons.person, color: Color(0xfff4a925), size: 30),
              label: Text('logout',
                  style: TextStyle(color: Colors.white, fontSize: 16)))
        ],
      ),
      floatingActionButton: !fbutton(displayScreen)
          ? FloatingActionButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          titlePadding: EdgeInsets.all(0),
                          titleTextStyle:
                              TextStyle(color: Colors.white, fontSize: 24),
                          title: Container(
                            padding: EdgeInsets.all(16),
                            color: Colors.grey[900],
                            child: Center(
                              child: Text(displayScreen == 0
                                  ? "Add Doctor info"
                                  : displayScreen == 1
                                      ? "Add Department info"
                                      : displayScreen == 2
                                          ? "Add Rooms"
                                          : "Add ambulance"),
                            ),
                          ),
                          content: displayScreen == 0
                              ? DoctorForm()
                              : displayScreen == 1
                                  ? DepartForm()
                                  : displayScreen == 2
                                      ? RoomForm()
                                      : AmbulanceForm());
                    });
              },
              child: Icon(Icons.add),
            )
          : SizedBox(),
      body: Container(
        color: Colors.white,
        child: Row(
          children: [
            Sidebuttons(
              onIconPress: (int icon) {
                setState(() {
                  displayScreen = icon;
                });
              },
            ),
            if (displayScreen == 0)
              Doctor()
            else if (displayScreen == 1)
              Department()
            else if (displayScreen == 2)
              Room()
            else if (displayScreen == 3)
              Ambulance()
            else if (displayScreen == 4)
              Notifications()
            else if (displayScreen == 5)
              Hospitald()
          ],
        ),
      ),
    );
  }
}
