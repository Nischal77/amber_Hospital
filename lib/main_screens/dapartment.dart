import 'package:amber_Hospital/model/hospital.dart';
import 'package:amber_Hospital/model/user.dart';
import 'package:amber_Hospital/services/database.dart';
import 'package:amber_Hospital/shared/loading2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Department extends StatelessWidget {
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
                child: ListView.builder(
                    itemCount: hospitaldata.departments.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          width: MediaQuery.of(context).size.width * 0.80,
                          height: 80,
                          decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          margin: EdgeInsets.all(8),
                          child: Center(
                            child: Text(hospitaldata.departments[index]["name"],
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                )),
                          ));
                    }));
          } else
            return Loading2();
        });
  }
}
