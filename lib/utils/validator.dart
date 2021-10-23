String? getEmailValidationError(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your email!';
  } else if (!_emailValid(value)) {
    return 'You entered invalid email!';
  }
  return null;
}

String? getPasswordValidationError(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your password!';
  } else if (value.length < 8) {
    return 'Your password must include a minimum of 8 characters.';
  }
  return null;
}

String? geUserNameValidationError(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your name!';
  } else if (value.length <= 5) {
    return 'Your name must contains at least 6 characters';
  }
  return null;
}

bool _emailValid(String email) {
  return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}