import 'package:amber_Hospital/Forms/assign.dart';
import 'package:amber_Hospital/model/ambulance.dart';
import 'package:amber_Hospital/model/doctor.dart';
import 'package:amber_Hospital/model/hospital.dart';
import 'package:amber_Hospital/model/user.dart';
import 'package:amber_Hospital/services/database.dart';
import 'package:amber_Hospital/shared/loading2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<Notifications> {
  bool expand1 = false, expand2 = false;
  String doctor = "Choose a doctor";
  String ambulance = "Choose a ambulance";
  Doctor seldoctor, remdoctor;
  Ambulance selambulance, remambulance;
  List color = [Colors.yellow, Colors.white, Colors.white];
  List menu = ["New Cases", "Assigned Cases", "Completed Cases"];
  int active = 0;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<Hospital>(
        stream: DatabaseService(uid: user.uid).hospitalData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Hospital hospitaldata = snapshot.data;
            return Container(
              color: Colors.grey[300],
              width: MediaQuery.of(context).size.width * 0.87,
              height: MediaQuery.of(context).size.height,
              child: Column(children: [
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.80,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (int i = 0; i < menu.length; i++)
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                active = i;
                              });
                            },
                            child: Container(
                              width: 185,
                              height: 50,
                              color: active == i ? Colors.yellow : Colors.white,
                              child: Container(
                                margin: EdgeInsets.only(bottom: 3),
                                color: Colors.white,
                                child: Center(
                                  child: Text(menu[i],
                                      style: TextStyle(
                                          fontSize: 20,
                                          decoration: TextDecoration.none,
                                          color: Colors.black)),
                                ),
                              ),
                            )),
                    ],
                  ),
                ),
                active == 0
                    ? SingleChildScrollView(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.8,
                          child: ListView.builder(
                              itemCount: hospitaldata.notification.length,
                              itemBuilder: (BuildContext context, int i) {
                                return Container(
                                  margin: EdgeInsets.all(10),
                                  height: 120,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  16, 8, 0, 16),
                                              width: 450,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                      hospitaldata.notification[
                                                              i]['date'] +
                                                          "   " +
                                                          hospitaldata
                                                                  .notification[
                                                              i]['time'],
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                          color: Colors.black)),
                                                  Text(
                                                      hospitaldata
                                                              .notification[i]
                                                          ['name'],
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                          color: Colors.black)),
                                                  Text(
                                                      hospitaldata
                                                              .notification[i]
                                                          ['sex'],
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                          color: Colors.black))
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 450,
                                              margin: EdgeInsets.fromLTRB(
                                                  16, 0, 0, 16),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(children: [
                                                    Text("CASE",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            decoration:
                                                                TextDecoration
                                                                    .none,
                                                            color:
                                                                Colors.black)),
                                                    Text(
                                                        hospitaldata
                                                                .notification[i]
                                                            ['emergency'],
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            decoration:
                                                                TextDecoration
                                                                    .none,
                                                            color:
                                                                Colors.black))
                                                  ]),
                                                  Column(children: [
                                                    Text("LOCATION",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            decoration:
                                                                TextDecoration
                                                                    .none,
                                                            color:
                                                                Colors.black)),
                                                    Text(
                                                        hospitaldata
                                                                .notification[i]
                                                            ["location"],
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            decoration:
                                                                TextDecoration
                                                                    .none,
                                                            color:
                                                                Colors.black))
                                                  ]),
                                                  Column(children: [
                                                    Text("CONTACT",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            decoration:
                                                                TextDecoration
                                                                    .none,
                                                            color:
                                                                Colors.black)),
                                                    Text(
                                                        hospitaldata
                                                                .notification[i]
                                                            ['guardianContact'],
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            decoration:
                                                                TextDecoration
                                                                    .none,
                                                            color:
                                                                Colors.black))
                                                  ])
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                    titlePadding:
                                                        EdgeInsets.all(0),
                                                    titleTextStyle: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 24),
                                                    title: Container(
                                                        padding:
                                                            EdgeInsets.all(16),
                                                        color: Colors.grey[900],
                                                        child: Center(
                                                            child: Text(
                                                                "Assign"))),
                                                    content: Assign());
                                              });
                                        },
                                        child: Container(
                                            height: 120,
                                            width: 80,
                                            decoration: BoxDecoration(
                                                color: Colors.grey[700],
                                                borderRadius:
                                                    BorderRadius.horizontal(
                                                        right: Radius.circular(
                                                            10))),
                                            padding: EdgeInsets.all(4),
                                            child: Icon(Icons.edit,
                                                color: Color(0xfff4a925))),
                                      )
                                    ],
                                  ),
                                );
                              }),
                        ),
                      )
                    : active == 1
                        ? Container(width: 20, height: 500, color: Colors.red)
                        : Container(width: 20, height: 500, color: Colors.blue)
              ]),
            );
          } else
            return Loading2();
        });
  }
}
