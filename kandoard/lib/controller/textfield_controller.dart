import 'package:flutter/material.dart';

class TextFieldController extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();
  final TextEditingController genericTextController = TextEditingController();
  String _errorInput = '';
  String get errorInput => _errorInput;

  String getEmailFromTextField() {
    return emailController.text.trim();
  }

  String getPasswordFromTextField() {
    return passwordController.text;
  }

  String getPasswordConfirmFromTextField() {
    return passwordController.text;
  }

  String getGenericTextFromTextField() {
    return genericTextController.text;
  }

  String? validationEmail(String value) {
    if (!value.contains(RegExp(
        r'^[a-zA-Z0-9.!#$%&*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$'))) {
      return 'Digite um email valido';
    } else {
      return null;
    }
  }

  String? validationPassword(String value) {
    if (value.length < 8) {
      return 'A senha precisa ter no minimo 8 caracteres';
    }
    return null;
  }

  String? test(value, errorLabel) {
    if (value == null || value.isEmpty) {
      return errorLabel;}
      return null;
    }

  void setErrorMenssage(String messageError) {
    _errorInput = messageError;
    notifyListeners();
  }
}
