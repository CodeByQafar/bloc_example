extension  StringExtension on String? {
  bool get isValidEmail {
    final emailRegex = RegExp(
             r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9\w-]+\.[a-zA-Z]+");
    return emailRegex.hasMatch(this??' ');
  }
  bool get containAnyUpperCase {
    final upperCaseRegex = RegExp(r'^(?=.*?[A-Z])');
    return upperCaseRegex.hasMatch(this??' ');
  }
  bool get characterCountMoreThan8 {
    return (this??' ').length >= 8;
  }
  bool get containAnySpecialCharacter {
    final specialCharRegex = RegExp(r'^(?=.*?[!@#\$&*~])');
    return specialCharRegex.hasMatch(this??' ');
  }
  bool get containAnyNumber {
    final numberRegex = RegExp(r'^(?=.*?[0-9])');
    return numberRegex.hasMatch(this??' ');
  }
  bool get isValidPassword {
    final passwordRegex = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    return passwordRegex.hasMatch(this??' ');
  }
}