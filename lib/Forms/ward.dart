import 'package:amber_Hospital/model/hospital.dart';
import 'package:amber_Hospital/model/ward.dart';
import 'package:amber_Hospital/services/database.dart';
import 'package:amber_Hospital/shared/loading2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:amber_Hospital/model/user.dart';

class RoomForm extends StatefulWidget {
  @override
  _RoomFormState createState() => _RoomFormState();
}

class _RoomFormState extends State<RoomForm> {
  final _formKey = GlobalKey<FormState>();
  String department = "choose a department", name, noOfBeds;
  bool expand = false;
  double hei = 100;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<Hospital>(
        stream: DatabaseService(uid: user.uid).hospitalData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Hospital hospitaldata = snapshot.data;
            return Container(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.height * 0.5,
              child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                "Name:",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ),
                            Container(
                              constraints: BoxConstraints(maxWidth: 500),
                              height: 60,
                              width: MediaQuery.of(context).size.height * 0.32,
                              child: TextFormField(
                                //checks if the field is empty or not
                                validator: (input) {
                                  if (input.isEmpty) {
                                    return 'Provide a name';
                                  } else
                                    return null;
                                },
                                onChanged: (input) => name = input,
                                decoration: new InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(8),
                                  border: OutlineInputBorder(),
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                ),
                                keyboardType: TextInputType.name,
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ]),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                "department:",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (expand == true) {
                                    expand = false;
                                    hei = 200;
                                  } else {
                                    expand = true;
                                    hei = 100;
                                  }
                                });
                              },
                              child: Column(children: [
                                Container(
                                    padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(10),
                                        border:
                                            Border.all(color: Colors.black)),
                                    constraints: BoxConstraints(maxWidth: 500),
                                    height: 40,
                                    width: MediaQuery.of(context).size.height *
                                        0.32,
                                    child: Center(
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                          Expanded(
                                              child: Text(
                                            department,
                                            style: TextStyle(fontSize: 14),
                                          )),
                                          Icon(expand
                                              ? Icons.keyboard_arrow_up
                                              : Icons.keyboard_arrow_down)
                                        ]))),
                                expand
                                    ? SingleChildScrollView(
                                        child: Container(
                                          constraints:
                                              BoxConstraints(maxWidth: 500),
                                          height: 100,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.32,
                                          child: ListView.builder(
                                              itemCount: hospitaldata
                                                  .departments.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      department = hospitaldata
                                                              .departments[
                                                          index]["name"];
                                                      expand = false;
                                                      hei = 100;
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 20,
                                                    margin: EdgeInsets.all(1),
                                                    color: Colors.grey[100],
                                                    child: Center(
                                                      child: Text(
                                                        hospitaldata
                                                                .departments[
                                                            index]["name"],
                                                        style: TextStyle(
                                                            fontSize: 12),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                        ),
                                      )
                                    : SizedBox()
                              ]),
                            )
                          ]),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                "No of Beds:",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ),
                            Container(
                              constraints: BoxConstraints(maxWidth: 500),
                              height: 60,
                              width: MediaQuery.of(context).size.height * 0.32,
                              child: TextFormField(
                                //checks if the field is empty or not
                                validator: (input) {
                                  if (input.isEmpty) {
                                    return 'Provide a valid number';
                                  } else
                                    return null;
                                },
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                onChanged: (input) => noOfBeds = input,
                                decoration: new InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(8),
                                  border: OutlineInputBorder(),
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                ),
                                keyboardType: TextInputType.number,
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ]),
                      GestureDetector(
                        onTap: () async {
                          if (_formKey.currentState.validate()) {
                            Ward ward = Ward(
                                name: name,
                                department: department,
                                noOfBeds: noOfBeds);
                            await Firestore.instance
                                .collection("hospital")
                                .document(user.uid)
                                .updateData({
                              "wards": FieldValue.arrayUnion([ward.toJson()])
                            });
                            Navigator.pop(context);
                          }
                        },
                        child: Container(
                            constraints: BoxConstraints(maxWidth: 500),
                            width: MediaQuery.of(context).size.height * 0.32,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: Colors.grey[800],
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.save, color: Colors.white),
                                SizedBox(width: 20),
                                Text("Save",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ))
                              ],
                            )),
                      )
                    ],
                  )),
            );
          } else
            return Loading2();
        });
  }
}
