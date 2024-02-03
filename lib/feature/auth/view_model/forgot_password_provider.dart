import 'package:bende_fazla/feature/auth/repository/auth_repository.dart';
import 'package:bende_fazla/product/mixin/index.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordProvider extends ChangeNotifier with ValidateManager {
  final AuthRepository _authRepository = AuthRepository(
    firebaseAuth: FirebaseAuth.instance,
  );
  String email = '';
  bool isAutoValidate = false;

  void setEmail(String value) {
    email = value;
    notifyListeners();
  }

  void changeAutoValidate() {
    isAutoValidate = !isAutoValidate;
    notifyListeners();
  }

  String? emailValidate(String? value) {
    return emailValidator(value);
  }

  void resetPasswordMail({
    required BuildContext context,
    required bool mounted,
  }) {
    _authRepository.resetPasswordMail(
      context: context,
      email: email,
      mounted: mounted,
    );
  }
}
