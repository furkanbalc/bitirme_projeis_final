import 'package:bende_fazla/core/routes/routes.dart';
import 'package:bende_fazla/feature/auth/model/location_model.dart';
import 'package:bende_fazla/feature/auth/model/user_model.dart';
import 'package:bende_fazla/product/enums/firebase_collections.dart';
import 'package:bende_fazla/product/helpers/index.dart';
import 'package:bende_fazla/product/service/storage_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class UserInfoRepository {
  final StorageService storageService = StorageService(firebaseStorage: FirebaseStorage.instance);
  UserInfoRepository({required this.firestore, required this.firebaseAuth});
  final FirebaseFirestore firestore;
  final FirebaseAuth firebaseAuth;

  //**
  //  GET USER INFO
  // */
  Future<UserModel?> getCurrentUserInfo() async {
    UserModel? user;
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await firestore.collection(FirebaseCollections.users.name).doc(firebaseAuth.currentUser?.uid).get();
    user = UserModel.fromFirestore(snapshot);
    return user;
  }

  Future<void> updateLocation(Location newLocation) async {
    await firestore.collection(FirebaseCollections.users.name).doc(firebaseAuth.currentUser?.uid).update({
      'location': newLocation.toJson(),
    });
  }

  //**
  //  SAVE USER INFO
  // */
  void saveUserInfoFirestore({
    required String username,
    required var profileImage,
    required BuildContext context,
    required bool mounted,
  }) async {
    try {
      showLoadingDialog(context: context, message: UserInfoRepositoryStrings.savedUserInfo.value);
      String uid = firebaseAuth.currentUser!.uid;
      String profileImageUrl = profileImage is String ? profileImage : '';
      if (profileImage != null && profileImage is! String) {
        profileImageUrl = await storageService.storeFileToFirebase(
          'profileImage/$uid',
          profileImage,
        );
      }
      UserModel user = UserModel(
        email: firebaseAuth.currentUser!.email!,
        username: username,
        uid: uid,
        profileImageUrl: profileImageUrl,
        isActive: true,
      );
      await firestore.collection(FirebaseCollections.users.name).doc(uid).set(user.toFirestore());
      if (!mounted) return;
      Navigator.pushNamedAndRemoveUntil(context, Routes.base, (route) => false, arguments: user);
    } catch (e) {
      Navigator.pop(context);
      customAlertDialog(context: context, message: e.toString());
    }
  }
}

enum UserInfoRepositoryStrings {
  savedUserInfo('Kullanıcı bilgileri kaydediliyor ...'),
  ;

  final String value;
  const UserInfoRepositoryStrings(this.value);
}
