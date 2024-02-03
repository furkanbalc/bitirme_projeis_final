import 'dart:io';
import 'dart:typed_data';

import 'package:bende_fazla/feature/auth/repository/user_info_repository.dart';
import 'package:bende_fazla/feature/auth/view/image_picker.dart';
import 'package:bende_fazla/product/helpers/index.dart';
import 'package:bende_fazla/product/mixin/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';

class UserInfoProvider extends ChangeNotifier with ValidateManager {
  /// variables
  final UserInfoRepository _userInfoRepository = UserInfoRepository(
    firebaseAuth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  );

  File? imageCamera;
  Uint8List? imageGallery;

  String username = '';
  String? validateMessage;
  bool isAutoValidate = false;

  /// functions
  bool get nullCheck => imageCamera != null || imageGallery != null;

  void changeAutoValidate() {
    isAutoValidate = !isAutoValidate;
    notifyListeners();
  }

  void setUsername(String value) {
    username = value;
    notifyListeners();
  }

  void setImageCamera(File? imageCamera) {
    imageCamera = imageCamera;
    notifyListeners();
  }

  void setImageGallery(Uint8List? imageGallery) {
    imageGallery = imageGallery;
    notifyListeners();
  }

  String? userNameValidate(String? value) {
    return userNameValidator(value);
  }

  //**
  //  SAVE USER INFO
  // */
  void saveUserInfoFirestore({
    required BuildContext context,
    required bool mounted,
  }) {
    _userInfoRepository.saveUserInfoFirestore(
      context: context,
      username: username,
      profileImage: imageCamera ?? imageGallery,
      mounted: mounted,
    );
  }

  Future<void> pickImageFromCamera({required BuildContext context}) async {
    Navigator.of(context).pop();
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      imageCamera = File(image!.path);
      imageGallery = null;
      notifyListeners();
    } catch (e) {
      // ignore: use_build_context_synchronously
      customAlertDialog(context: context, message: e.toString());
    }
  }

  Future<void> pickImageFromGallery({required BuildContext context}) async {
    Navigator.pop(context);
    final image = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ImagePickerView(),
      ),
    );
    if (image == null) return;
    imageGallery = image;
    imageCamera = null;
    notifyListeners();
  }

  Future<void> pickImageRemove({required BuildContext context}) async {
    Navigator.pop(context);
    imageGallery = null;
    imageCamera = null;
    notifyListeners();
  }
}
