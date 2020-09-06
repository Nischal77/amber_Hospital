import 'package:amber_Hospital/model/hospital.dart';
import 'package:amber_Hospital/model/user.dart';
import 'package:amber_Hospital/services/database.dart';
import 'package:amber_Hospital/shared/loading2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Room extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<Object>(
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
                    itemBuilder: (BuildContext context, int i) {
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.80,
                        decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(4),
                        child: Column(children: [
                          Text(
                            hospitaldata.departments[i]['name'],
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              for (var j = 0;
                                  j < hospitaldata.wards.length;
                                  j++)
                                if (hospitaldata.wards[j]['department'] ==
                                    hospitaldata.departments[i]['name'])
                                  Column(
                                    children: [
                                      Text(hospitaldata.wards[j]['name'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500)),
                                      Text(hospitaldata.wards[j]['noOfBeds'] +
                                          " beds")
                                    ],
                                  )
                            ],
                          )
                        ]),
                      );
                    }));
          } else
            return Loading2();
        });
  }
}
