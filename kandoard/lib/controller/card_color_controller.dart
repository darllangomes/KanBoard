
import 'package:flutter/material.dart';
import 'package:kandoard/shared/app_colors.dart';

Color cardColor(String cardPriority) {
  switch (cardPriority) {
    case 'low':
      return Colors.lightGreen;
    case 'medium':
      return Colors.yellow;
    case 'high':
      return Colors.red;
    default:
      return AppColors.blue;
  }
}
