import 'package:bende_fazla/feature/auth/model/user_model.dart';
import 'package:bende_fazla/feature/auth/repository/auth_repository.dart';
import 'package:bende_fazla/feature/auth/repository/user_info_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  final AuthRepository _authRepository = AuthRepository(
    firebaseAuth: FirebaseAuth.instance,
  );
  final UserInfoRepository _userInfoRepository = UserInfoRepository(
    firestore: FirebaseFirestore.instance,
    firebaseAuth: FirebaseAuth.instance,
  );
  UserModel? user;
  //**
  //  GET USER INFO
  // */
  Future<void> getCurrentUserInfo() async {
    user = await _userInfoRepository.getCurrentUserInfo();
    notifyListeners();
  }

  Future<void> signOut({
    required BuildContext context,
    required bool mounted,
  }) async {
    _authRepository.signOut(
      context: context,
      mounted: mounted,
    );
  }
}
