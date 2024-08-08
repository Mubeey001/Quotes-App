import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart'; 

class RegisterAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserCredential?> registerUser(
      String username, String fullname, String email, String password) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'username': username,
        'fullname': fullname,
        'email': email,
      });

      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw Exception('The email is already in use by another account.');
      } else {
        throw Exception('Failed to register user: ${e.message}');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType) {
        throw Exception(
            'No network connection. Please check your Wi-Fi or mobile data.');
      } else {
        throw Exception('Failed to register user due to network issues.');
      }
    } catch (e) {
      throw Exception('Failed to register user: $e');
    }
  }
}
