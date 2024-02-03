class AppValidator {
  final String upperValidate = 'Şifreniz en az bir büyük harf içermelidir.';
  final String specialCh = 'Şifreniz en az bir özel karakter içermelidir.';
  final String digitValidate = 'Şifreniz en az bir rakam  içermelidir.';

  final String emailNotNull = 'E-posta boş olamaz.';
  final String activeEmail = 'Geçerli bir e-posta girin.';
  final String passwordNotNull = 'Şifre boş olamaz.';
  final String passwordMinCh = 'Şifreniz en az 6 karakter uzunluğunda olmalıdır.';
  final String passwordSame = 'Şifreler aynı olmalıdır.';

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return emailNotNull;
    }
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return activeEmail;
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return passwordNotNull;
    }
    if (value.length < 6) {
      return passwordMinCh;
    } else if (!value.contains(RegExp(r'[A-Z]'))) {
      return upperValidate;
    } else if (!value.contains(RegExp(r'[0-9]'))) {
      return digitValidate;
    } else if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return specialCh;
    }
    return null;
  }

  String? tryPasswordValidator(String? value, String? pass, String? pass2) {
    if (value == null || value.isEmpty) {
      return passwordNotNull;
    }
    if (pass != pass2) {
      return passwordSame;
    }
    return null;
  }

  String? loginPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return passwordNotNull;
    }
    if (value.length < 6) {
      return passwordMinCh;
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    final phoneNumberRegExp = RegExp(r'^\d{10}$');

    if (!phoneNumberRegExp.hasMatch(value)) {
      return 'Invalid phone number format (10 digits required).';
    }
    return null;
  }
}
