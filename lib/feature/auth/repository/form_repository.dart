import 'package:bende_fazla/feature/auth/repository/auth_repository.dart';

abstract class FormRepository {
  FormRepository({
    required this.authRepository,
    required this.isVisible,
    required this.isAutoValidate,
    required this.email,
    required this.password,
  });
  final AuthRepository authRepository;

  bool isVisible;
  bool isAutoValidate;

  String email;
  String password;

  void changeAutoValidate();
  void changeVisibility();
  void setEmail(String value);
  void setPassword(String value);
  String? emailValidate(String? value);
  String? passwordValidate(String? value);
}
