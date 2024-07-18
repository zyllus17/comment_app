import 'package:comment_app/services/loading.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService with ChangeNotifier {
  final LoadingState _loadingState;
  final FirebaseAuth _auth = FirebaseAuth.instance;
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
}
