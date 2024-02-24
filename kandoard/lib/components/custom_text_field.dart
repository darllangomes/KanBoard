import 'package:flutter/material.dart';
import 'package:kandoard/controller/textfield_controller.dart';
import 'package:kandoard/shared/app_colors.dart';
import 'package:kandoard/shared/app_measures.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  final String label;
  final IconData labelIcon;
  TextInputType keyboardInputType;
  final bool isObscureText;
  final TextEditingController controller;
  String errorLabel;

  CustomTextField(
      {super.key,
      required this.label,
      required this.labelIcon,
      required this.controller,
      required this.errorLabel,
      this.keyboardInputType = TextInputType.text,
      this.isObscureText = false});

  @override
  Widget build(BuildContext context) {
    TextFieldController inputController = TextFieldController();
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          //TODO: refatorar utilização dos if's encadeados para outra coisa
          //TODO: validação de confirmação de senha do usuario - para saber se senhas são iguais
          if (value == null || value.isEmpty) {
            return errorLabel;
          } else if (keyboardInputType == TextInputType.emailAddress) {
            return inputController.validationEmail(value);
          } else if (keyboardInputType == TextInputType.text) {
            return inputController.validationPassword(value);
          } else {
            return null;
          }
        },
        onChanged: (text) {},
        obscureText: isObscureText,
        keyboardType: keyboardInputType,
        style: TextStyle(color: AppColors.blue, fontWeight: FontWeight.w300),
        decoration: InputDecoration(
            prefixIcon: Icon(
              labelIcon,
              color: AppColors.blue,
              grade: 2,
            ),
            labelText: label,
            labelStyle: TextStyle(
              color: AppColors.blue,
              fontSize: 20,
              fontWeight: FontWeight.w300,
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(AppMeasures.borderRadius))),
      ),
    );
  }
}
