import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../models/user_model.dart';

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  UserModel? _user;
  bool _isLoading = false;

  UserModel? get user => _user;
  bool get isLoading => _isLoading;

  Future<UserModel?> signInWithEmailAndPassword(String email, String password) async {
    try {
      _isLoading = true;
      notifyListeners();

      final UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (result.user != null) {
        final userData = await _firestore.collection('users').doc(result.user!.uid).get();
        _user = UserModel.fromJson(userData.data()!);
        notifyListeners();
        return _user;
      }
      return null;
    } catch (e) {
      print('Error en signInWithEmailAndPassword: $e');
      return null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<UserModel?> registerWithEmailAndPassword(
    String email,
    String password,
    String name,
    String phoneNumber,
  ) async {
    try {
      _isLoading = true;
      notifyListeners();

      final UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (result.user != null) {
        final userModel = UserModel(
          uid: result.user!.uid,
          email: email,
          name: name,
          phoneNumber: phoneNumber,
          createdAt: DateTime.now(),
        );

        await _firestore.collection('users').doc(result.user!.uid).set(userModel.toJson());
        _user = userModel;
        notifyListeners();
        return _user;
      }
      return null;
    } catch (e) {
      print('Error en registerWithEmailAndPassword: $e');
      return null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    _user = null;
    notifyListeners();
  }
} 