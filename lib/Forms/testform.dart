import 'package:amber_Hospital/model/ambulance.dart';
import 'package:amber_Hospital/model/doctor.dart';
import 'package:amber_Hospital/model/hospital.dart';
import 'package:amber_Hospital/services/database.dart';
import 'package:amber_Hospital/shared/loading2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:amber_Hospital/model/user.dart';

class Assign extends StatefulWidget {
  @override
  _AssignFormState createState() => _AssignFormState();
}

class _AssignFormState extends State<Assign> {
  final _formKey = GlobalKey<FormState>();
  String id, location, driverName, email, number, status;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    bool expand1 = false, expand2 = false;
    String doctor = "Choose a doctor";
    String ambulance = "Choose a ambulance";
    Doctor seldoctor, remdoctor;
    Ambulance selambulance, remambulance;
    List doctors = ["safa", "ada", "ada"];
    List ambulances = ["adw", "wd", "fdg", "awa", "dwf"];

    //return StreamBuilder<Hospital>(
    //stream: DatabaseService(uid: user.uid).hospitalData,
    //builder: (context, snapshot) {
    //if (snapshot.hasData) {
    //Hospital hospitaldata = snapshot.data;
    return Container(
      height: MediaQuery.of(context).size.height * 0.48,
      width: MediaQuery.of(context).size.height * 0.5,
      child: Form(
          key: _formKey,
          child: Column(children: [
            GestureDetector(
              onTap: () {
                print(expand1);
                setState(() {
                  expand1 ? expand1 = true : expand1 = false;
                });
              },
              child: Column(children: [
                Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black)),
                    constraints: BoxConstraints(maxWidth: 500),
                    height: 40,
                    width: MediaQuery.of(context).size.height * 0.32,
                    child: Center(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                          Expanded(
                              child: Text(
                            doctor,
                            style: TextStyle(fontSize: 14),
                          )),
                          Icon(expand1
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down)
                        ]))),
                expand1
                    ? SingleChildScrollView(
                        child: Container(
                          constraints: BoxConstraints(maxWidth: 500),
                          height: 100,
                          width: MediaQuery.of(context).size.height * 0.32,
                          child: ListView.builder(
                              itemCount: doctors.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      expand1 = false;
                                      doctor = doctors[index];
                                      remdoctor = doctors[index];
                                      seldoctor = Doctor(
                                          name: doctors[index]["name"],
                                          email: doctors[index]["email"],
                                          department: doctors[index]
                                              ["department"],
                                          achievement: doctors[index]
                                              ["achievement"],
                                          address: doctors[index]["address"],
                                          contact: doctors[index]["contact"],
                                          state: "busy");
                                    });
                                  },
                                  child: Container(
                                    height: 20,
                                    margin: EdgeInsets.all(1),
                                    color: Colors.grey[100],
                                    child: Center(
                                      child: Text(
                                        doctors[index],
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      )
                    : SizedBox()
              ]),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  expand2 ? expand2 = false : expand2 = true;
                });
              },
              child: Column(children: [
                Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black)),
                    constraints: BoxConstraints(maxWidth: 500),
                    height: 40,
                    width: MediaQuery.of(context).size.height * 0.32,
                    child: Center(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                          Expanded(
                              child: Text(
                            ambulance,
                            style: TextStyle(fontSize: 14),
                          )),
                          Icon(expand2
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down)
                        ]))),
                expand2
                    ? SingleChildScrollView(
                        child: Container(
                          constraints: BoxConstraints(maxWidth: 500),
                          height: 100,
                          width: MediaQuery.of(context).size.height * 0.32,
                          child: ListView.builder(
                              itemCount: ambulances.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      expand2 = false;
                                    });
                                  },
                                  child: Container(
                                    height: 20,
                                    margin: EdgeInsets.all(1),
                                    color: Colors.grey[100],
                                    child: Center(
                                      child: Text(
                                        ambulance[index],
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      )
                    : SizedBox()
              ]),
            ),
            RaisedButton(
                child: Text("Assign"),
                onPressed: () async {
                  await Firestore.instance
                      .collection("hospital")
                      .document(user.uid)
                      .updateData({
                    "doctors": FieldValue.arrayRemove([remdoctor])
                  });
                  await Firestore.instance
                      .collection("hospital")
                      .document(user.uid)
                      .updateData({
                    "doctors": FieldValue.arrayUnion([seldoctor.toJson()])
                  });
                  await Firestore.instance
                      .collection("hospital")
                      .document(user.uid)
                      .updateData({
                    "ambulance": FieldValue.arrayRemove([remambulance])
                  });
                  await Firestore.instance
                      .collection("hospital")
                      .document(user.uid)
                      .updateData({
                    "ambulance": FieldValue.arrayUnion([selambulance.toJson()])
                  });
                })
          ])),
    );
  }
}
