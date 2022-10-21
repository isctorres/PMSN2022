import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class EmailAuthentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
          email: 'isctorres@gmail.com', password: '12345678');

      User user = userCredential.user!;
      user.sendEmailVerification();

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      return false;
    }
  }
}
