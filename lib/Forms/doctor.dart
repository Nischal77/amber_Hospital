import 'package:amber_Hospital/model/doctor.dart';
import 'package:amber_Hospital/model/hospital.dart';
import 'package:amber_Hospital/services/database.dart';
import 'package:amber_Hospital/shared/loading2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:amber_Hospital/model/user.dart';

class DoctorForm extends StatefulWidget {
  @override
  _DoctorFormState createState() => _DoctorFormState();
}

class _DoctorFormState extends State<DoctorForm> {
  final _formKey = GlobalKey<FormState>();
  String name,
      address,
      contact,
      email,
      department = "choose a department",
      achievement;
  bool expand = false;
  double hei = 200;

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
                                "Address:",
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
                                    return 'Provide an address';
                                  } else
                                    return null;
                                },
                                onChanged: (input) => address = input,
                                decoration: new InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(8),
                                  border: OutlineInputBorder(),
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                ),
                                keyboardType: TextInputType.streetAddress,
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
                                "Contact no:",
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
                                onChanged: (input) => contact = input,
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
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                "Email:",
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
                                    return 'Provide an email';
                                  } else
                                    return null;
                                },
                                onChanged: (input) => email = input,
                                decoration: new InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(8),
                                  border: OutlineInputBorder(),
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                ),
                                keyboardType: TextInputType.emailAddress,
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
                                "Department:",
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
                      Row(children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "Achievement:",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.height * 0.32,
                        )
                      ]),
                      Container(
                        constraints: BoxConstraints(maxWidth: 500),
                        height: hei,
                        width: MediaQuery.of(context).size.height * 0.48,
                        child: TextFormField(
                          //checks if the field is empty or not
                          validator: (input) {
                            if (input.isEmpty) {
                              return 'Provide achievement';
                            } else
                              return null;
                          },
                          onChanged: (input) => achievement = input,
                          decoration: new InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(8),
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.grey[200],
                          ),
                          keyboardType: TextInputType.multiline,
                          maxLines: 6,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (_formKey.currentState.validate()) {
                            Doctor doctor = Doctor(
                                name: name,
                                contact: contact,
                                achievement: achievement,
                                address: address,
                                department: department,
                                email: email);
                            await Firestore.instance
                                .collection("hospital")
                                .document(user.uid)
                                .updateData({
                              "doctors":
                                  FieldValue.arrayUnion([doctor.toJson()])
                            });
                            Navigator.pop(context);
                          }
                        },
                        child: Container(
                            margin: EdgeInsets.all(8),
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
