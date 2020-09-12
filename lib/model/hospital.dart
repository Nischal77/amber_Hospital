import 'dart:html';

class Hospital {
  final String name;
  final Coordinates location;
  final List doctors, departments, wards, ambulance, notification;
  Hospital(
      {this.name,
      this.location,
      this.doctors,
      this.departments,
      this.ambulance,
      this.wards,
      this.notification});
}
