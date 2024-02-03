mixin ValidateManager {
  final String upperValidate = 'En az bir büyük harf içermelidir(A-Z)\n';
  final String digitValidate = 'En az bir rakam harf içermelidir(0-9)\n';
  final String specialCharValidate = 'En az bir özel karakter içermelidir(!@#%^&*(),.?":{}|<>+-)\n';

  final String emailNotNull = 'E-posta boş olamaz';
  final String invalidEmail = 'Geçersiz e-posta adresi';
  final String passwordNotNull = 'Şifre boş olamaz';
  final String passwordMinCh = 'Şifreniz en az 6 karakter içermelidir';
  final String passwordSame = 'Şifreler aynı olmalıdır';
  final String usernameIsNotEmpty = 'Ad Soyad kısmı boş geçilemez!';

  /// EMAIL VALIDATOR
  String? emailValidator(String? value) {
    // bool isValidEmail = RegExp(
    //   r'^[a-z0-9.%+-]+@[a-z0-9.-]+\.[a-z]{2,}$',
    // ).hasMatch(value!);

    // if (value.isEmpty) {
    //   return emailNotNull;
    // } else if (!isValidEmail) {
    //   return activeEmail;
    // }
    // return null;
    if (value == null || value.isEmpty) {
      return emailNotNull;
    }
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return invalidEmail;
    }
    return null;
  }

  /// PASSWORD VALIDATOR
  String? passwordValidator(String? value, String? pass, String? pass2) {
    if (value == null || value.isEmpty) {
      return passwordNotNull;
    }
    if (value.length < 6) {
      return passwordMinCh;
    }

    bool containsUppercase = RegExp(r'[A-Z]').hasMatch(value);
    bool containsSpecialChar = RegExp(r'[!@#$%^&*(),.?":{}|<>+-]').hasMatch(value);
    bool containsDigit = RegExp(r'\d').hasMatch(value);

    if (!containsUppercase && !containsSpecialChar && !containsDigit) {
      return upperValidate + specialCharValidate + digitValidate;
    } else if (!containsUppercase && !containsSpecialChar) {
      return upperValidate + specialCharValidate;
    } else if (!containsUppercase && !containsDigit) {
      return upperValidate + digitValidate;
    } else if (!containsSpecialChar && !containsDigit) {
      return specialCharValidate + digitValidate;
    } else if (!containsUppercase) {
      return upperValidate;
    } else if (!containsSpecialChar) {
      return specialCharValidate;
    } else if (!containsDigit) {
      return digitValidate;
    }
    return null;
    // return null;
    // if (value == null || value.isEmpty) {
    //   return passwordNotNull;
    // }
    // if (value.length < 6) {
    //   return passwordMinCh;
    // } else if (!value.contains(RegExp(r'[A-Z]'))) {
    //   return upperValidate;
    // } else if (!value.contains(RegExp(r'[0-9]'))) {
    //   return digitValidate;
    // } else if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    //   return specialCharValidate;
    // }
    // return null;
  }

  /// VERIFY PASSWORD VALIDATOR
  String? confirmPasswordValidator(String? value, String? pass, String? pass2) {
    if (value == null || value.isEmpty) {
      return passwordNotNull;
    }
    if (pass != pass2) {
      return passwordSame;
    }
    return null;
  }

  /// LOGIN PASSWORD VALIDATOR
  String? loginPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return passwordNotNull;
    }
    if (value.length < 6) {
      return passwordMinCh;
    }
    return null;
  }

  /// USER INFO USERNAME VALIDATOR
  String? userNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return usernameIsNotEmpty;
    }
    return null;
  }
}
