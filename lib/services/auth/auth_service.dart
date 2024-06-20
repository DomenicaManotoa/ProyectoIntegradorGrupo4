import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Sign in
  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, 
        password: password,
      );

      // Update Firestore with login information (if necessary)
      _firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
        'lastLogin': FieldValue.serverTimestamp(), // Optional: Track last login time
      }, SetOptions(merge: true));

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // Create a new user
  Future<UserCredential> signUpWithEmailAndPassword(
    String email,
    String password,
    String name,
    String lastName,
    String phone,
    String address,
  ) async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Create a new document for the user with additional information
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
        'name': name,
        'lastName': lastName,
        'phone': phone,
        'address': address,
        'createdAt': FieldValue.serverTimestamp(),
      });

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }
  

  // Sign out
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  
  Future<void> updateUser({
  required String uid,
  required String name,
  required String lastName,
  required String phone,
  required String address,
}) async {
  try {
    await _firestore.collection('users').doc(uid).update({
      'name': name,
      'lastName': lastName,
      'phone': phone,
      'address': address,
    });
  } catch (e) {
    throw Exception(e.toString());
  }
}
}
