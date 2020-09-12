import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:amber_Hospital/model/hospital.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //collection
  final CollectionReference hospitalCollection =
      Firestore.instance.collection('hospital');

  Future changeHospitalData(String name, String location, List doctors,
      List departments, List wards, List ambulance, List notification) async {
    return await hospitalCollection.document(uid).setData({
      'name': name,
      'location': location,
      'doctors': doctors,
      'departments': departments,
      'wards': wards,
      'ambulance': ambulance,
      'notification': notification
    });
  }

  Stream<Hospital> get hospitalData {
    return hospitalCollection
        .document(uid)
        .snapshots()
        .map(_hospitalDataFromSnapshot);
  }

  Hospital _hospitalDataFromSnapshot(DocumentSnapshot snapshot) {
    return Hospital(
        name: snapshot.data['name'],
        location: snapshot.data['location'],
        doctors: snapshot.data['doctors'],
        departments: snapshot.data['departments'],
        wards: snapshot.data['wards'],
        ambulance: snapshot.data['ambulance'],
        notification: snapshot.data['notification']);
  }
}
