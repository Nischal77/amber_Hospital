import 'package:amber_Hospital/model/dapartment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:amber_Hospital/model/user.dart';

class DepartForm extends StatefulWidget {
  @override
  _DepartFormState createState() => _DepartFormState();
}

class _DepartFormState extends State<DepartForm> {
  final _formKey = GlobalKey<FormState>();
  String name;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
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
              GestureDetector(
                onTap: () async {
                  if (_formKey.currentState.validate()) {
                    Department depart = Department(name: name);
                    await Firestore.instance
                        .collection("hospital")
                        .document(user.uid)
                        .updateData({
                      "departments": FieldValue.arrayUnion([depart.toJson()])
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
