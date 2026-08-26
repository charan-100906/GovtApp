class Patient {
  final String id;
  final String name;
  final String uhid;
  final String age;
  final String gender;
  final String phone;

  Patient({
    required this.id,
    required this.name,
    required this.uhid,
    required this.age,
    required this.gender,
    required this.phone,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'uhid': uhid,
    'age': age,
    'gender': gender,
    'phone': phone,
  };

  factory Patient.fromMap(Map<String, dynamic> map, String id) {
    return Patient(
      id: id,
      name: map['name'] ?? '',
      uhid: map['uhid'] ?? '',
      age: map['age'] ?? '',
      gender: map['gender'] ?? '',
      phone: map['phone'] ?? '',
    );
  }
}