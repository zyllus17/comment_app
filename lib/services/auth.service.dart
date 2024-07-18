import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comment_app/services/loading.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService with ChangeNotifier {
  final LoadingState _loadingState;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? _user;

  User? get user => _user;

  AuthService(this._loadingState) {
    _auth.authStateChanges().listen(_onAuthStateChanged);
  }

  Future<void> _onAuthStateChanged(User? user) async {
    _user = user;
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    _loadingState.setLoading(true);
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    _loadingState.setLoading(false);
  }

  Future<void> signOut() async {
    _loadingState.setLoading(true);
    await _auth.signOut();
    _loadingState.setLoading(false);
  }

  Future<void> signUp(String email, String password) async {
    _loadingState.setLoading(true);
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    _loadingState.setLoading(false);
  }

  Future<void> signUpWithUserData(
      String name, String email, String password) async {
    _loadingState.setLoading(true);
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;

      if (user != null) {
        await _firestore.collection('users').doc(user.uid).set({
          'uid': user.uid,
          'name': name,
          'email': email,
          'createdAt': FieldValue.serverTimestamp(),
        });
      }
      _loadingState.setLoading(false);
    } on FirebaseAuthException catch (e) {
      _loadingState.setLoading(false);
      if (e.code == 'email-already-in-use') {
        throw Exception(
            'The email address is already in use by another account.');
      } else {
        throw Exception('Failed to sign up. Please try again.');
      }
    } catch (e) {
      _loadingState.setLoading(false);
      throw Exception('Failed to sign up. Please try again.');
    }
  }
}
