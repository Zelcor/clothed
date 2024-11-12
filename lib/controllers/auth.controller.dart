import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import '../models/user.model.dart';
import '../models/user_info.model.dart';
import '../controllers/auth.controller.dart';
import '../services/firebase.options.dart';
import '../views/login.view.dart';
import '../views/clothing_list.view.dart';
import '../views/profile.view.dart';
import '../controllers/clothing.controller.dart';

class AuthController with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Connexion avec Firebase Auth
  Future<UserModel?> login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return UserModel.fromFirebaseUser(userCredential.user);
    } catch (e) {
      print("Erreur lors de la connexion: $e");
      return null;
    }
  }

  // Déconnexion
  Future<void> logout() async {
    await _auth.signOut();
  }

   // Vérifier l'état de connexion
  Stream<UserModel?> get userStream {
    return _auth.authStateChanges().map((user) {
      if (user != null) {
        return UserModel.fromFirebaseUser(user);
      } else {
        return null;
      }
    });
  }

  // update userinfo
  Future<void> updateUserInfo(UserInfoModel userInfo) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(userInfo.id).update(userInfo.toMap());
    } catch (e) {
      print("Erreur lors de la mise à jour de l'utilisateur: $e");
    }
  }

  // ajout de getUserInfo
  Object getUserInfo() {
    final user = _auth.currentUser;
    if (user != null) {
      return UserInfoModel.getUserInfoById(user.uid);
    } else {
      return UserInfoModel(id: '', password: '', birthday: '', address: '', postalCode: '', city: '');
    }
  }
}