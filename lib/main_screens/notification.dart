import 'package:amber_Hospital/model/hospital.dart';
import 'package:amber_Hospital/model/user.dart';
import 'package:amber_Hospital/services/database.dart';
import 'package:amber_Hospital/shared/loading2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    int active = 0;
    List menus = ["New Cases", "Assigned", "Completed"];
    return StreamBuilder<Hospital>(
        stream: DatabaseService(uid: user.uid).hospitalData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Hospital hospitaldata = snapshot.data;
            return Container(
              color: Colors.grey[300],
              width: MediaQuery.of(context).size.width * 0.87,
              height: MediaQuery.of(context).size.height,
              child: Column(children: [
                Container(
                    child: Row(children: [
                  for (int i = 0; i < menus.length; i++)
                    Container(
                        color: active == i ? Color(0xfff4a925) : Colors.white,
                        child: Container(child: Text(menus[i])))
                ])),
                Text(hospitaldata.notification.length.toString()),
                Container(
                  width: MediaQuery.of(context).size.width * 0.87,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black,
                  child: ListView.builder(
                      itemCount: hospitaldata.notification.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          color: Colors.grey[700],
                          width: MediaQuery.of(context).size.width * 0.80,
                          height: 100,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                    "Emergency:" +
                                        hospitaldata.notification[index]
                                            ['emergency'],
                                    style: TextStyle(color: Colors.black)),
                                Text(
                                    "Guardian Contact:" +
                                        hospitaldata.notification[index]
                                            ['guardianContact'],
                                    style: TextStyle(color: Colors.black)),
                              ]),
                        );
                      }),
                ),
              ]),
            );
          } else
            return Loading2();
        });
  }
}
