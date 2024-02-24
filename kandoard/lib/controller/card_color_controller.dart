
import 'package:flutter/material.dart';
import 'package:kandoard/shared/app_colors.dart';

Color cardColor(String cardPriority) {
  switch (cardPriority) {
    case 'low':
      return AppColors.green;
    case 'medium':
      return AppColors.yellow;
    case 'high':
      return AppColors.red;
    default:
      return AppColors.blue;
  }
}
