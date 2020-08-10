import 'package:amber_Hospital/data/doctor.dart';
import 'package:flutter/material.dart';

class Doctor extends StatelessWidget {
  @override
  double rows;
  Widget build(BuildContext context) {
    int noOfrows() {
      rows = MediaQuery.of(context).size.width / 250;
      return rows.toInt();
    }

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
                    color: Colors.black,
                  ),
                  border: InputBorder.none),
            ),
          ),
          Expanded(
            child: GridView.builder(
                itemCount: doctor.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: noOfrows()),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                      padding: EdgeInsets.all(8),
                      child: Card(
                        elevation: 8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height:
                                    MediaQuery.of(context).size.width * 0.25,
                                child: Card(
                                    elevation: 8, color: Colors.grey[800])),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, top: 4),
                              child: Text(doctor[index].name),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, top: 2),
                              child: Text(
                                  "Department: " + doctor[index].department),
                            )
                          ],
                        ),
                      ));
                }),
          )
        ],
      ),
    );
  }
}
