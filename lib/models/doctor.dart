class Doctor {
  final String id;
  final String name;
  final String department;
  final String specialization;
  final bool isAvailable;

  Doctor({
    required this.id,
    required this.name,
    required this.department,
    required this.specialization,
    this.isAvailable = true,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'department': department,
    'specialization': specialization,
    'isAvailable': isAvailable,
  };

  factory Doctor.fromMap(Map<String, dynamic> map, String id) {
    return Doctor(
      id: id,
      name: map['name'] ?? '',
      department: map['department'] ?? '',
      specialization: map['specialization'] ?? '',
      isAvailable: map['isAvailable'] ?? true,
    );
  }
}