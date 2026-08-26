class FirestoreService {
  Future<void> savePatientRegistration(Map<String, dynamic> data) async {
    await Future.delayed(const Duration(milliseconds: 500));
  }

  Future<String> generateOpToken(String department) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return 'T-${(1000 + (DateTime.now().millisecond % 9000))}';
  }
}