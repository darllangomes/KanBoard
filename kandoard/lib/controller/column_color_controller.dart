import 'package:flutter/material.dart';
import 'package:kandoard/shared/app_colors.dart';

Color columnColor(int columnWip, int cardCount) {
  if(cardCount > columnWip) {
    return AppColors.red;
  } else {
    return AppColors.blue;
  }
}