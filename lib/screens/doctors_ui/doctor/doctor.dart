class Doctor {
  final String id;
  final String name;
  final String specialty;
  final String hospital;

  Doctor({
    required this.id,
    required this.name,
    required this.specialty,
    required this.hospital,
  });

  factory Doctor.fromMap(Map<dynamic, dynamic> map, String id) {
    return Doctor(
      id: id,
      name: map['name'] as String,
      specialty: map['specialty'] as String,
      hospital: map['hospital'] as String,
    );
  }
}
