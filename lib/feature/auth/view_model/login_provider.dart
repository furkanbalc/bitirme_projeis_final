import 'package:bende_fazla/feature/auth/repository/auth_repository.dart';
import 'package:bende_fazla/feature/auth/repository/form_repository.dart';
import 'package:bende_fazla/product/mixin/index.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier with ValidateManager implements FormRepository {
  /// variables
  @override
  AuthRepository get authRepository => AuthRepository(firebaseAuth: FirebaseAuth.instance);

  @override
  String email = '';

  @override
  String password = '';

  @override
  bool isAutoValidate = false;

  @override
  bool isVisible = true;

  /// Functions
  @override
  void changeAutoValidate() {
    isAutoValidate = !isAutoValidate;
    notifyListeners();
  }

  @override
  void changeVisibility() {
    isVisible = !isVisible;
    notifyListeners();
  }

  @override
  void setEmail(String value) {
    email = value;
    notifyListeners();
  }

  @override
  void setPassword(String value) {
    password = value;
    notifyListeners();
  }

  @override
  String? emailValidate(String? value) {
    return emailValidator(value);
  }

  @override
  String? passwordValidate(String? value) {
    return loginPasswordValidator(value);
  }

  /// Login
  void loginUser({
    required BuildContext context,
    required bool mounted,
  }) {
    authRepository.logInUser(
      context: context,
      email: email,
      password: password,
      mounted: mounted,
    );
  }
}
