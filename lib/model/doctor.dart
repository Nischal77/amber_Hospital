class Doctor {
  final String name, department, address, contact, email, achievement, state;
  Doctor(
      {this.name,
      this.department,
      this.achievement,
      this.address,
      this.contact,
      this.email,
      this.state});

  Doctor.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        department = json['department'],
        achievement = json['achievement'],
        address = json['address'],
        contact = json['contact'],
        email = json['email'],
        state = json['state'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'department': department,
        'achievement': achievement,
        'address': address,
        'contact': contact,
        'email': email,
        'state': state
      };
}
