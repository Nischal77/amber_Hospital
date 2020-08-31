class Doctor {
  final String name, department, address, contact, email, achievement;
  Doctor(
      {this.name,
      this.department,
      this.achievement,
      this.address,
      this.contact,
      this.email});

  Doctor.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        department = json['department'],
        achievement = json['achievement'],
        address = json['address'],
        contact = json['contact'],
        email = json['email'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'department': department,
        'achievement': achievement,
        'address': address,
        'contact': contact,
        'email': email
      };
}
