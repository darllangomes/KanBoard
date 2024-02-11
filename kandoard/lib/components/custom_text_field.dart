import 'package:flutter/material.dart';
import 'package:kandoard/controller/textfield_controller.dart';
import 'package:kandoard/shared/app_colors.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  final String label;
  final IconData labelIcon;
  TextInputType keyboardInputType ;
  final bool isObscureText;
  final TextEditingController controller;

  CustomTextField(
      {super.key,
      required this.label,
      required this.labelIcon,
      required this.controller,
      this.keyboardInputType = TextInputType.text,
      this.isObscureText = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 26.0, right: 26, top: 15, bottom: 15),
      child: TextFormField(
        onChanged: (text) {
          print(text);
        },
        obscureText: isObscureText,
        keyboardType: keyboardInputType,
        style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w300),
        decoration: InputDecoration(
            prefixIcon: Icon(
              labelIcon,
              color: AppColors.white,
            ),
            labelText: label,
            labelStyle: TextStyle(
              color: AppColors.white,
              fontSize: 20,
              fontWeight: FontWeight.w300,
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}
