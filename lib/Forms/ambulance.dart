import 'package:amber_Hospital/model/doctor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:amber_Hospital/model/user.dart';

class AmbulanceForm extends StatefulWidget {
  @override
  _AmbulanceFormState createState() => _AmbulanceFormState();
}

class _AmbulanceFormState extends State<AmbulanceForm> {
  final _formKey = GlobalKey<FormState>();
  String name, address, contact, email, department, achievement;
  List doctors;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
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
                    Container(
                      constraints: BoxConstraints(maxWidth: 500),
                      height: 60,
                      width: MediaQuery.of(context).size.height * 0.32,
                      child: TextFormField(
                        //checks if the field is empty or not
                        validator: (input) {
                          if (input.isEmpty) {
                            return 'Provide a department';
                          } else
                            return null;
                        },
                        onChanged: (input) => department = input,
                        decoration: new InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.all(8),
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.grey[200],
                        ),
                        keyboardType: TextInputType.text,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ]),
              Row(children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "Achievement:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.height * 0.32,
                )
              ]),
              Container(
                constraints: BoxConstraints(maxWidth: 500),
                height: 200,
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
                      "doctors": FieldValue.arrayUnion([doctor.toJson()])
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
  }
}
