import 'package:amber_Hospital/model/ambulance.dart';
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
  String id, location, driverName, email, number, status;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Container(
      height: MediaQuery.of(context).size.height * 0.48,
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
                        "Id:",
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
                            return 'Provide a ambulance number';
                          } else
                            return null;
                        },
                        onChanged: (input) => id = input,
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
                        "Driver Name:",
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
                            return 'Provide driver name';
                          } else
                            return null;
                        },
                        onChanged: (input) => driverName = input,
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
                        onChanged: (input) => number = input,
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
                        "location:",
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
                            return 'Provide a location';
                          } else
                            return null;
                        },
                        onChanged: (input) => location = input,
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
              GestureDetector(
                onTap: () async {
                  if (_formKey.currentState.validate()) {
                    Ambulance ambulance = Ambulance(
                        id: id,
                        driverName: driverName,
                        number: number,
                        location: location,
                        email: email);
                    await Firestore.instance
                        .collection("hospital")
                        .document(user.uid)
                        .updateData({
                      "ambulance": FieldValue.arrayUnion([ambulance.toJson()])
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
