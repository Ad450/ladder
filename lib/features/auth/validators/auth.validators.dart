class AuthValidator {
  static ValidatorResult validateLoginFields(String? email, String? password) {
    if ((email == null || email.isEmpty) || (password == null || password.isEmpty)) {
      return ValidatorResult(isValid: false, message: "credentials cant be null");
    }
    final regex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (!regex.hasMatch(email)) {
      return ValidatorResult(isValid: false, message: "email not valid");
    }
    if (password.length < 6) {
      return ValidatorResult(isValid: false, message: "password should be more than 6");
    }

    return ValidatorResult(isValid: true);
  }

  static ValidatorResult validateSignupFields({
    required String? email,
    required String? password,
    required String? name,
  }) {
    final emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    final nameRegex = RegExp(r'^[A-Za-z ]+$');

    if ((email == null || email.isEmpty) || (password == null || password.isEmpty) || (name == null || name.isEmpty)) {
      return ValidatorResult(isValid: false, message: "credentials cant be null");
    }

    if (!emailRegex.hasMatch(email)) {
      return ValidatorResult(isValid: false, message: "email not valid");
    }
    if (password.length < 6) {
      return ValidatorResult(isValid: false, message: "password should be more than 6");
    }
    if (!nameRegex.hasMatch(name)) {
      return ValidatorResult(isValid: false, message: "name should be only letters");
    }
    if (name.length < 3) {
      return ValidatorResult(isValid: false, message: "name should be three or more letters");
    }

    return ValidatorResult(isValid: true);
  }
}

class ValidatorResult {
  final String? message;
  final bool isValid;

  ValidatorResult({this.message, required this.isValid});
}
