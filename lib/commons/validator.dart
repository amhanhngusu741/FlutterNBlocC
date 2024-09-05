class Validators {
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  static isValidEmail(String email) {
    return _emailRegExp.hasMatch(email);
  }

  static isRequiredField(String text) {
    return text.isNotEmpty;
  }

  static isMatchText(String text1, String text2) {
    if (text1.isEmpty || text2.isEmpty || text1 != text2)
      return false;
    else
      return true;
  }
}
