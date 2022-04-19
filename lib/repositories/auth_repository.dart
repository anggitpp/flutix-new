import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../models/custom_error.dart';

class AuhtRepository {
  final FirebaseFirestore firebaseFirestore;
  final auth.FirebaseAuth firebaseAuth;
  AuhtRepository({
    required this.firebaseFirestore,
    required this.firebaseAuth,
  });

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    String errorMessage = '';

    try {
      auth.UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {}
    } on auth.FirebaseAuthException catch (e) {
      errorMessage = e.message!;
      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The account already exists for that email.';
      }
      throw CustomError(code: e.code, message: errorMessage, plugin: e.plugin);
    } catch (e) {
      CustomError(
        code: 'Exception',
        message: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }
}
