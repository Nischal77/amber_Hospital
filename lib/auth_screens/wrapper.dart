import 'package:amber_Hospital/Forms/ambulance.dart';
import 'package:amber_Hospital/auth_screens/welcome.dart';
import 'package:amber_Hospital/main_screens/home.dart';
import 'package:amber_Hospital/model/hospital.dart';
import 'package:amber_Hospital/model/user.dart';
import 'package:amber_Hospital/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:amber_Hospital/services/database.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    //check whether user is signed in or not and show either welcome screen or main screen
    if (user == null) {
      return Welcome();
    } else {
      return StreamBuilder<Hospital>(
        stream: DatabaseService(uid: user.uid).hospitalData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Hospital hospitalData = snapshot.data;
            if (hospitalData.name == "")
              return HospitalForm();
            else
              return Home();
          } else
            return Loading();
        },
      );
    }
  }
}
