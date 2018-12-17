class LoginFormValidation {
  static String validatePassword(input) {
    if (input.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  static String validateUsername(input) {
    if (input.isEmpty) {
      return 'Please enter your username';
    }
    return null;
  }
}
