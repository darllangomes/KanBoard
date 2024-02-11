import 'package:flutter/material.dart';

class TextFieldController {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController genericTextController = TextEditingController();

  String getEmailFromTextField() {
    return emailController.text.trim();
  }

  String getPasswordFromTextField() {
    return passwordController.text;
  }

  String getGenericTextFromTextField() {
    return genericTextController.text;
  }
}