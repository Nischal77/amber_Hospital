class Department {
  final String name;
  Department({this.name});

  Department.fromJson(Map<String, dynamic> json) : name = json['name'];

  Map<String, dynamic> toJson() => {
        'name': name,
      };
}
