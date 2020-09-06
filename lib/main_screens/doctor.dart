import 'package:amber_Hospital/model/hospital.dart';
import 'package:amber_Hospital/model/user.dart';
import 'package:amber_Hospital/services/database.dart';
import 'package:amber_Hospital/shared/loading2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Doctor extends StatelessWidget {
  @override
  double rows;
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    int noOfrows() {
      rows = MediaQuery.of(context).size.width / 250;
      return rows.toInt();
    }

    return StreamBuilder<Hospital>(
        stream: DatabaseService(uid: user.uid).hospitalData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Hospital hospitaldata = snapshot.data;
            return AnimatedContainer(
              padding: EdgeInsets.all(8),
              duration: Duration(milliseconds: 500),
              color: Colors.grey[300],
              width: MediaQuery.of(context).size.width * 0.87,
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[800],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Search doctors',
                          hintStyle: TextStyle(color: Colors.white),
                          suffixIcon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          border: InputBorder.none),
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                        itemCount: hospitaldata.doctors.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                noOfrows() > 3 ? noOfrows() - 1 : noOfrows()),
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                              padding: EdgeInsets.all(8),
                              child: GestureDetector(
                                onLongPress: () {
                                  return showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          elevation: 8,
                                          content: Text(
                                              "Are you sure you want to delete this doctor?"),
                                          actions: [
                                            RaisedButton(
                                              color: Colors.green,
                                              onPressed: () async {
                                                await Firestore.instance
                                                    .collection("hospital")
                                                    .document(user.uid)
                                                    .updateData({
                                                  "doctors":
                                                      FieldValue.arrayRemove([
                                                    hospitaldata.doctors[index]
                                                  ])
                                                });
                                                Navigator.pop(context);
                                              },
                                              child: Text("Yes"),
                                            ),
                                            RaisedButton(
                                              color: Colors.red,
                                              child: Text("No"),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            )
                                          ],
                                        );
                                      });
                                },
                                child: Card(
                                  elevation: 8,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.all(4),
                                          child: Card(
                                              child: Center(
                                                child: Icon(
                                                  Icons.person,
                                                  size: 80,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              elevation: 8,
                                              color: Colors.grey[800]),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0, top: 4),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(hospitaldata.doctors[index]
                                                  ["name"]),
                                              Icon(
                                                Icons.adjust,
                                                size: 16,
                                                color:
                                                    hospitaldata.doctors[index]
                                                                ["state"] ==
                                                            "active"
                                                        ? Colors.green
                                                        : Colors.red,
                                              )
                                            ]),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0, top: 2),
                                        child: Text("Department: " +
                                            hospitaldata.doctors[index]
                                                ["department"]),
                                      )
                                    ],
                                  ),
                                ),
                              ));
                        }),
                  )
                ],
              ),
            );
          } else
            return Loading2();
        });
  }
}
