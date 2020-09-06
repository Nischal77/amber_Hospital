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
                  width: MediaQuery.of(context).size.width * 0.87,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.87,
                        child: Center(
                          child: Text(
                            hospitaldata.name,
                            style: TextStyle(fontSize: 64),
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          hospitaldata.location,
                          style: TextStyle(fontSize: 44),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.80,
                        height: MediaQuery.of(context).size.height * 0.7,
                        margin: EdgeInsets.all(8),
                        child: ListView.builder(
                            itemCount: hospitaldata.departments.length,
                            itemBuilder: (BuildContext context, int i) {
                              return Container(
                                  padding: EdgeInsets.all(4),
                                  margin: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                      color: Colors.grey[400],
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(children: [
                                    Text(
                                      hospitaldata.departments[i]['name'],
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(children: [
                                          Text(
                                            "Doctors",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          for (var j = 0;
                                              j < hospitaldata.doctors.length;
                                              j++)
                                            if (hospitaldata.doctors[j]
                                                    ['department'] ==
                                                hospitaldata.departments[i]
                                                    ['name'])
                                              Text(hospitaldata.doctors[j]
                                                  ['name'])
                                        ]),
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Wards",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              for (var j = 0;
                                                  j < hospitaldata.wards.length;
                                                  j++)
                                                if (hospitaldata.wards[j]
                                                        ['department'] ==
                                                    hospitaldata.departments[i]
                                                        ['name'])
                                                  Text(hospitaldata.wards[j]
                                                      ['name'])
                                            ])
                                      ],
                                    )
                                  ]));
                            }),
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
