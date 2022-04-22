import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../config/constant.dart';
import '../models/custom_error.dart';

class AuthRepository {
  final FirebaseFirestore firebaseFirestore;
  final auth.FirebaseAuth firebaseAuth;
  AuthRepository({
    required this.firebaseFirestore,
    required this.firebaseAuth,
  });

  Future<void> signUp({required String email, required String password}) async {
    String errorMessage = '';
    String code = '';

    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on auth.FirebaseAuthException catch (e) {
      errorMessage = e.message!;
      code = e.code;
      if (e.code == 'email-already-in-use') {
        errorMessage =
            'The account already exists for that email. Please sign in with your email.';
        code = 'Email Already registered';
      }
      throw CustomError(code: code, message: errorMessage, plugin: e.plugin);
    } catch (e) {
      CustomError(
        code: 'Exception',
        message: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  Future<void> confirmAccount(
      {required String name,
      required String email,
      required List<String> genres,
      required String language,
      required String imagePath}) async {
    try {
      auth.User user = firebaseAuth.currentUser!;
      String uid = user.uid;

      await userRef.doc(uid).set({
        'name': name,
        'email': email,
        'genres': genres,
        'language': language,
        'imagePath': imagePath,
        'uid': uid,
        'createdAt': DateTime.now().toIso8601String(),
      });
    } on auth.FirebaseAuthException catch (e) {
      throw CustomError(code: e.code, message: e.message!, plugin: e.plugin);
    } catch (e) {
      CustomError(
        code: 'Exception',
        message: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }
}
