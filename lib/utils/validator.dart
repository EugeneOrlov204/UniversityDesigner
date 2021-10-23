bool emailValid(String email) {
  return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

String? emailValidationError(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your email!';
  } else if (!emailValid(value)) {
    return 'You entered invalid email!';
  }
  return null;
}

String? passwordValidationError(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your password!';
  } else if (value.length < 8) {
    return 'Your password must include a minimum of 8 characters.';
  }
  return null;
}