class Ambulance {
  final String id, location, driverName, number, email;
  Ambulance({this.id, this.location, this.driverName, this.number, this.email});

  Ambulance.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        location = json['location'],
        driverName = json['driverName'],
        number = json['number'],
        email = json['email'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'location': location,
        'driverName': driverName,
        'number': number,
        'email': email
      };
}
