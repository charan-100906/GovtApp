class Department {
  final String id;
  final String name;
  final int activeDoctorsCount;

  Department({
    required this.id,
    required this.name,
    required this.activeDoctorsCount,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'activeDoctorsCount': activeDoctorsCount,
  };

  factory Department.fromMap(Map<String, dynamic> map, String id) {
    return Department(
      id: id,
      name: map['name'] ?? '',
      activeDoctorsCount: map['activeDoctorsCount'] ?? 0,
    );
  }
}