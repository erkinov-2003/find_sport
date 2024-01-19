class SignUpValidator {
  static String? nameValidator(String value) {
    if (value.isEmpty) {
      return "Iltimos name bo'sh qoldirmang!";
    } else {
      return null;
    }
  }

  static String? lastName(String value) {
    if (value.isEmpty) {
      return "Iltimos name bo'sh qoldirmang!";
    } else {
      return null;
    }
  }

  static String? phoneNumber(String value) {
    if (value.isEmpty) {
      return "Iltimos name bo'sh qoldirmang!";
    } else {
      return null;
    }
  }

  static String? password(String value) {
    if (value.length < 8) {
      return "Iltimos 8 tadan ko'proq soz kiriting!";
    }
    if (value.isEmpty) {
      return "Iltimos name bo'sh qoldirmang!";
    } else {
      return null;
    }
  }

  static String? confirmPassword(String value) {
    if (value.length < 8) {
      return "Iltimos password 8 tadan ko'proq kiriting!";
    }
    if (value.isEmpty) {
      return "Iltimos name bo'sh qoldirmang!";
    } else {
      return null;
    }
  }
}
