import 'package:flutter/material.dart';
import 'package:kandoard/model/card_model.dart';

import '../shared/app_colors.dart';
import '../shared/app_measures.dart';

Future<void> ViewCardContent(context, {required CardModel card}) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            backgroundColor: AppColors.grey,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppMeasures.borderRadius)),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.delete_forever, color: AppColors.blue,)),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.close,
                            color: AppColors.blue,
                          ))
                    ],
                  ),
                  Text(
                    card.getcardTitle,
                    style: TextStyle(color: AppColors.blue, fontSize: 24, fontWeight: FontWeight.w300),

                  ),
                  const SizedBox(height: 16,),
                  Text(
                    "Descrição: ${card.getcardDescription}",
                    style: TextStyle(color: AppColors.blue, fontSize: 16, fontWeight: FontWeight.w300),

                  ),

                   Text(
                    "Prioridade: ${card.getcardPriority}",
                    style: TextStyle(color: AppColors.blue, fontSize: 16, fontWeight: FontWeight.w300),

                  ),
                ],
              ),
            ));
      });
}
