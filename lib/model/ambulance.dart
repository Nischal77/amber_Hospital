class Ambulance {
  final String id, location, driverName, number, email, active;
  Ambulance(
      {this.id,
      this.location,
      this.driverName,
      this.number,
      this.email,
      this.active});

  Ambulance.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        location = json['location'],
        driverName = json['driverName'],
        number = json['number'],
        email = json['email'],
        active = json['active'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'location': location,
        'driverName': driverName,
        'number': number,
        'email': email,
        'active': active
      };
}
