import 'package:amber_Hospital/model/hospital.dart';
import 'package:amber_Hospital/services/database.dart';
import 'package:amber_Hospital/shared/loading2.dart';
import 'package:flutter/material.dart';
import 'package:amber_Hospital/model/user.dart';
import 'package:provider/provider.dart';

class HospitalForm extends StatefulWidget {
  @override
  _HospitalFormState createState() => _HospitalFormState();
}

class _HospitalFormState extends State<HospitalForm> {
  String hospitalName, hospitalLocation;
  bool loading = false;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<Hospital>(
        stream: DatabaseService(uid: user.uid).hospitalData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Hospital hospitaldata = snapshot.data;
            return Material(
                color: Colors.grey[800],
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        constraints: BoxConstraints(maxWidth: 500),
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.9,
                        margin: EdgeInsets.all(5),
                        child: TextFormField(
                          //checks if the field is empty or not
                          validator: (input) {
                            if (input.isEmpty) {
                              return 'Provide a Hospital Name';
                            } else
                              return null;
                          },
                          onChanged: (input) => hospitalName = input,
                          decoration: new InputDecoration(
                              hintText: "Enter Hospital Name",
                              border: new UnderlineInputBorder(),
                              filled: true,
                              fillColor: Colors.grey[200],
                              prefixIcon:
                                  Icon(Icons.email, color: Color(0xfff4a925))),
                          keyboardType: TextInputType.text,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(maxWidth: 500),
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.9,
                        margin: EdgeInsets.all(5),
                        child: TextFormField(
                          //checks if the field is empty or not
                          validator: (input) {
                            if (input.isEmpty) {
                              return 'Provide a Hospital Location';
                            } else
                              return null;
                          },
                          onChanged: (input) => hospitalLocation = input,
                          decoration: new InputDecoration(
                              hintText: "Enter Hospital Loaction",
                              border: new UnderlineInputBorder(),
                              filled: true,
                              fillColor: Colors.grey[200],
                              prefixIcon:
                                  Icon(Icons.email, color: Color(0xfff4a925))),
                          keyboardType: TextInputType.text,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Container(
                          constraints: BoxConstraints(maxWidth: 500),
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                              color: Color(0xfff4a925),
                              borderRadius: BorderRadius.circular(15)),
                          child: FlatButton(
                              onPressed: () async {
                                //check if the validators are fullfilled
                                if (_formkey.currentState.validate()) {
                                  //enabling the loading state
                                  setState(() => loading = true);
                                  //wait for the signin function to complete
                                  await DatabaseService(uid: user.uid)
                                      .changeHospitalData(
                                          hospitalName,
                                          hospitalLocation,
                                          hospitaldata.doctors,
                                          hospitaldata.departments,
                                          hospitaldata.wards,
                                          hospitaldata.ambulance,
                                          hospitaldata.notificaton);
                                }
                              },
                              //shows loading bar when login button is clicked
                              child: loading
                                  ? CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation(
                                          Colors.grey[800]),
                                    )
                                  : Text("Submit",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ))))
                    ],
                  ),
                ));
          } else
            return Loading2();
        });
  }
}
