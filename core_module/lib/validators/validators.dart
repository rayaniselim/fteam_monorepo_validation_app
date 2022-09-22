class Validators {
  static String? passwordValidate({
    String? password,
  }) {
    if (password == null || password.trim().isEmpty) {
      return 'This field is required';
    }
    if (password.trim().length < 6) {
      return 'Password must be at least 6 characters in length';
    }
    return null;
  }

  static String? confirmPasswordValidate({
    String? password,
    String? confirmPassword,
  }) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'This field is required';
    }
    if (confirmPassword != password) {
      return 'Confimation password does not match the entered password';
    }
    return null;
  }
}
