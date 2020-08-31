import 'package:amber_Hospital/services/database.dart';
import 'package:amber_Hospital/shared/loading2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:amber_Hospital/model/user.dart';
import 'package:amber_Hospital/model/hospital.dart';

class Hospitald extends StatefulWidget {
  @override
  _HospitaldState createState() => _HospitaldState();
}

class _HospitaldState extends State<Hospitald> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user != null)
      return StreamBuilder<Hospital>(
          stream: DatabaseService(uid: user.uid).hospitalData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Hospital hospitaldata = snapshot.data;
              return Container(
                  color: Colors.grey[300],
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.87,
                        child: Center(
                          child: Text(
                            hospitaldata.name,
                            style: TextStyle(fontSize: 54),
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          hospitaldata.location,
                          style: TextStyle(fontSize: 54),
                        ),
                      )
                    ],
                  ));
            } else
              return Loading2();
          });
    else
      return Container();
  }
}
