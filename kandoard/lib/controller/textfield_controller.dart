import 'package:flutter/material.dart';

class TextFieldController extends ChangeNotifier {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController genericTextController = TextEditingController();
  String _errorInput = '';
  String get errorInput => _errorInput;

  String getEmailFromTextField() {
    return emailController.text.trim();
  }

  String getPasswordFromTextField() {
    return passwordController.text;
  }

  String getGenericTextFromTextField() {
    return genericTextController.text;
  }

  void setErrorMenssage(String messageError) {
    _errorInput = messageError;
    notifyListeners();
  }


}