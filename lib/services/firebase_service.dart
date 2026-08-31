import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Authentication
  Future<UserCredential> signIn(String email, String password) async {
    return await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  // Firestore Data Insertion
  Future<void> savePatientRecord(Map<String, dynamic> data) async {
    await _db.collection('patients').add({
      ...data,
      'createdAt': FieldValue.serverTimestamp(),
      'userId': _auth.currentUser?.uid,
    });
  }

  // Real-time Firestore Stream
  Stream<QuerySnapshot> getPatientQueue() {
    return _db.collection('patients').orderBy('createdAt', descending: true).snapshots();
  }
}