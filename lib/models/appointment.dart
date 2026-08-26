class Appointment {
  final String id;
  final String patientId;
  final String department;
  final String doctorId;
  final String tokenNumber;
  final DateTime date;
  final String status;

  Appointment({
    required this.id,
    required this.patientId,
    required this.department,
    required this.doctorId,
    required this.tokenNumber,
    required this.date,
    required this.status,
  });

  Map<String, dynamic> toMap() => {
    'patientId': patientId,
    'department': department,
    'doctorId': doctorId,
    'tokenNumber': tokenNumber,
    'date': date.toIso8601String(),
    'status': status,
  };

  factory Appointment.fromMap(Map<String, dynamic> map, String id) {
    return Appointment(
      id: id,
      patientId: map['patientId'] ?? '',
      department: map['department'] ?? '',
      doctorId: map['doctorId'] ?? '',
      tokenNumber: map['tokenNumber'] ?? '',
      date: DateTime.parse(map['date']),
      status: map['status'] ?? 'Pending',
    );
  }
}