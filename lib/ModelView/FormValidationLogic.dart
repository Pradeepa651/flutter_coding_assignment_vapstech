String? nameTextValidation(value) {
  if (value == null) {
    return null;
  }
  if (value.length < 6) {
    return 'Enter at least 6 character';
  }
  return null;
}

String? emailTextValidation(value) {
  if (value == null) {
    return null;
  }
  if (value.isEmpty) return 'Enter Email id';
  if (value.length < 6) {
    return 'Enter at least 6 character';
  }
  var re = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
  if (!re.hasMatch(value)) {
    return 'enter valid email id';
  }
  return null;
}

String? passwordTextValidation(value) {
  if (value == null) {
    return null;
  }
  if (value.length < 8) {
    return 'Enter at least 8 character';
  }
  var re =
      RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*()_+-]).{8,}$');
  if (!re.hasMatch(value)) {
    return 'Enter valid password';
  }
  return null;
}

String? reEnterPasswordTextValidation(value, password) {
  if (value == null) {
    return null;
  }
  if (value.length < 8) {
    return 'Enter at least 8 character';
  }
  if (value != password) return 'Password not match';
  return null;
}

String? phoneNumberValidation(value) {
  if (value == null) {
    return null;
  }
  if (value.length < 10) {
    return 'Enter at least 10 Number';
  }
  var re = RegExp(r'^\+?[0-9\s-]+$');
  if (!re.hasMatch(value)) {
    return 'Enter valid Phone Number';
  }
  return null;
}

String? addressValidation(value) {
  if (value == null) {
    return null;
  }
  if (value.length < 10) {
    return 'Enter at least 10 character';
  }
  var re = RegExp(r'^[#.0-9a-zA-Z\s,-]+$');
  if (!re.hasMatch(value)) {
    return 'Enter valid address';
  }
  return null;
}
