class Ward {
  final String department, name, noOfBeds;
  Ward({this.name, this.department, this.noOfBeds});

  Ward.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        department = json['department'],
        noOfBeds = json['noOfBeds'];

  Map<String, dynamic> toJson() =>
      {'name': name, 'department': department, 'noOfBeds': noOfBeds};
}
