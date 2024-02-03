import 'package:bende_fazla/feature/auth/repository/auth_repository.dart';
import 'package:bende_fazla/feature/auth/repository/form_repository.dart';
import 'package:bende_fazla/product/mixin/validate_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupProvider extends ChangeNotifier with ValidateManager implements FormRepository {
  /// variables
  @override
  AuthRepository get authRepository => AuthRepository(firebaseAuth: FirebaseAuth.instance);

  @override
  String email = '';

  @override
  String password = '';
  String passwordConfirm = '';

  @override
  bool isAutoValidate = false;

  @override
  bool isVisible = true;
  bool isVisibleConfirm = true;

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

  void changeVisibilityConfirm() {
    isVisibleConfirm = !isVisibleConfirm;
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

  void setPasswordConfirm(String value) {
    passwordConfirm = value;
    notifyListeners();
  }

  @override
  String? emailValidate(String? value) {
    return emailValidator(value);
  }

  @override
  String? passwordValidate(String? value) {
    return passwordValidator(value, password, passwordConfirm);
  }

  String? passwordConfirmValidate(String? value) {
    return confirmPasswordValidator(value, password, passwordConfirm);
  }

  /// Signup
  void sigunUpUser({
    required BuildContext context,
    required bool mounted,
  }) {
    authRepository.signUpUser(
      context: context,
      email: email,
      password: password,
      mounted: mounted,
    );
  }
}
