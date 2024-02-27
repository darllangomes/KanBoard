
import 'package:flutter/material.dart';
import 'package:kandoard/shared/app_colors.dart';
import 'package:kandoard/shared/app_measures.dart';

Future<void> statusDialog(BuildContext context, String message) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
              backgroundColor: AppColors.grey,
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppMeasures.borderRadius)),
              title: Text(
                message.toString(),
                style: TextStyle(color: AppColors.blue),
              ));
        });
  }