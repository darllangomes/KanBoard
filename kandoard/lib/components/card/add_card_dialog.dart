import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:kandoard/controller/textfield_controller.dart';
import 'package:kandoard/provider/column_provider.dart';
import 'package:kandoard/shared/app_colors.dart';
import 'package:kandoard/shared/app_measures.dart';
import 'package:provider/provider.dart';

Future<void> addCardDialog(BuildContext context, String columnId) {
  final cardTitle = TextEditingController();
  final cardDescription = TextEditingController();
  final cardFinalDate = TextEditingController();

  Map<String, String> members = {
    '': '',
    // 'Djavan': '1',
    // 'João': '2',
    // 'Vitoria': '3'
  };
  String cardMember = '';
  Map<String, String> priorities = {
    'Baixo': 'low',
    'Médio': 'medium',
    'Alto': 'high'
  };
  String cardPriority = 'low';

  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.grey,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppMeasures.borderRadius)),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Adicionar Cartão',
                  style: TextStyle(color: AppColors.blue, fontSize: 20)),
              IconButton(
                  onPressed: () {
                    final errorLabel = context.read<TextFieldController>();
                    if (errorLabel.errorInput != '') {
                      errorLabel.clearErrorMenssage();
                    }
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.close,
                    color: AppColors.blue,
                  ))
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Consumer<TextFieldController>(
                    builder: (context, errorValue, child) {
                  return Column(
                    children: [
                      TextFormField(
                        style: TextStyle(color: AppColors.blue),
                        controller: cardTitle,
                        decoration: InputDecoration(
                          errorText: errorValue.errorInput['name'] == ''
                              ? null
                              : errorValue.errorInput['name'],
                          labelText: 'Título',
                          labelStyle: TextStyle(
                            color: AppColors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  AppMeasures.borderRadius)),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        style: TextStyle(color: AppColors.blue),
                        controller: cardDescription,
                        decoration: InputDecoration(
                          errorText: errorValue.errorInput['description'] == ''
                              ? null
                              : errorValue.errorInput['description'],
                          labelText: 'Descrição',
                          labelStyle: TextStyle(
                            color: AppColors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  AppMeasures.borderRadius)),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DropdownButtonFormField<String>(
                        value: cardPriority,
                        style: TextStyle(color: AppColors.blue),
                        dropdownColor: AppColors.grey,
                        decoration: InputDecoration(
                          labelText: 'Prioridade',
                          labelStyle: TextStyle(
                            color: AppColors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  AppMeasures.borderRadius)),
                        ),
                        items: priorities.entries.map((entry) {
                          return DropdownMenuItem<String>(
                            value: entry.value,
                            child: Text(
                              entry.key,
                              style: TextStyle(
                                color: AppColors.blue,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          cardPriority = newValue!;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DropdownButtonFormField<String>(
                        value: cardMember,
                        style: TextStyle(color: AppColors.blue),
                        dropdownColor: AppColors.grey,
                        decoration: InputDecoration(
                          labelText: 'Membro',
                          labelStyle: TextStyle(
                            color: AppColors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  AppMeasures.borderRadius)),
                        ),
                        items: members.entries.map((entry) {
                          return DropdownMenuItem<String>(
                            value: entry.value,
                            child: Text(
                              entry.key,
                              style: TextStyle(
                                color: AppColors.blue,
                              ), // Cor do texto do item.
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          cardMember = newValue!;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DateTimePicker(
                        type: DateTimePickerType.date,
                        dateMask: 'yyyy-MM-dd',
                        controller: cardFinalDate,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100),
                        icon: const Icon(Icons.event),
                        dateLabelText: 'Data de entrega',
                        style: TextStyle(color: AppColors.blue),
                        decoration: InputDecoration(
                          errorText: errorValue.errorInput['date'] == ''
                              ? null
                              : errorValue.errorInput['date'],
                          labelText: 'Data de entrega',
                          labelStyle: TextStyle(
                            color: AppColors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  AppMeasures.borderRadius)),
                        ),
                      ),
                    ],
                  );
                }),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 54,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    AppMeasures.borderRadius)),
                            backgroundColor: AppColors.blue,
                          ),
                          child: Text(
                            'Criar',
                            style: TextStyle(
                                color: AppColors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.w300),
                          ),
                          onPressed: () {
                            final newCard = context.read<ColumnProvider>();
                            final errorLabel =
                                context.read<TextFieldController>();
                            if (cardTitle.text.isEmpty) {
                              errorLabel.clearErrorMenssage();
                              errorLabel.setErrorMenssage(
                                  'Digite um nome para a coluna', 'name');
                            } else if (cardFinalDate.text.isEmpty) {
                              errorLabel.clearErrorMenssage();
                              errorLabel.setErrorMenssage(
                                  'Informe uma data', 'date');
                            } else {
                              errorLabel.clearErrorMenssage();

                              // TODO: Criar lógica de criar um card e adicionar na coluna

                              //TODO: adicionar os membros
                              final date =
                                  '${DateTime.parse(cardFinalDate.text).toIso8601String()}Z';

                              print(date);
                              newCard.addNewCardToColumn(
                                  columnId: columnId,
                                  description: cardDescription.text,
                                  cardDueDate: date,
                                  cardPriority: cardPriority,
                                  cardTitle: cardTitle.text);

                              Navigator.of(context).pop();
                            }
                          }),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      });
}
