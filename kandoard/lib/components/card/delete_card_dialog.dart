import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/card_model.dart';
import '../../provider/column_provider.dart';
import '../../shared/app_colors.dart';
import '../../shared/app_measures.dart';

Future<void> deleteCardDialog({required BuildContext context, required CardModel card}) {
  return showDialog(
      context: context,
      builder: (BuildContext newContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppMeasures.borderRadius)),
          backgroundColor: AppColors.grey,
          title: Text('Excluir Cartão?'),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(AppMeasures.borderRadius)),
                  backgroundColor: AppColors.blue,
                ),
                onPressed: () {
                  final cardToDelete = context.read<ColumnProvider>();
                  cardToDelete.deleteCardFromColumn(card: card);

                  Navigator.pop(context);
                },
                child: Text(
                  'Sim',
                  style: TextStyle(
                      color: AppColors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w300),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(AppMeasures.borderRadius)),
                  backgroundColor: AppColors.blue,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Não',
                  style: TextStyle(
                      color: AppColors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w300),
                ),
              )
            ],
          ),
        );
      });
}
