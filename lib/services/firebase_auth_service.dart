class FirebaseAuthService {
  Future<bool> loginWithPhone(String phoneNumber) async {
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }

  Future<bool> verifyOTP(String otp) async {
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }

  Future<void> signOut() async {
    await Future.delayed(const Duration(milliseconds: 300));
  }
}