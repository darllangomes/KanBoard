import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:kandoard/controller/textfield_controller.dart';
import 'package:kandoard/provider/column_provider.dart';
import 'package:kandoard/shared/app_colors.dart';
import 'package:kandoard/shared/app_measures.dart';
import 'package:provider/provider.dart';

Future<void> addCardDialog(BuildContext context) {
  final cardTitle = TextEditingController();
  final cardDescription = TextEditingController();
  final cardFinalDate = TextEditingController();
  Map<String, String> members = {
    '': '',
    'Djavan': '1',
    'João': '2',
    'Vitoria': '3'
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
          title: const Text(
            'Adicionar Cartão',
            style: TextStyle(color: Color(0xFF7398C8)),
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
                        style: TextStyle(color: AppColors.white),
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
                        style: TextStyle(color: AppColors.white),
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
                        style: TextStyle(color: AppColors.white),
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
                              style: const TextStyle(
                                color: Colors.white,
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
                        style: TextStyle(color: AppColors.white),
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
                              style: const TextStyle(
                                color: Colors.white,
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
                        dateMask: 'dd/MM/yyyy',
                        controller: cardFinalDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        icon: const Icon(Icons.event),
                        dateLabelText: 'Data de entrega',
                        style: TextStyle(color: AppColors.white),
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
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 54,
                      width: 120,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    AppMeasures.borderRadius)),
                            backgroundColor: AppColors.blue,
                          ),
                          child: const Text(
                            'Criar',
                            style: TextStyle(
                                color: Color.fromARGB(255, 52, 52, 52),
                                fontSize: 20,
                                fontWeight: FontWeight.w300),
                          ),
                          onPressed: () {
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
                              //final date = DateTime.now();
                              //final projectsList = context.read<ColumnProvider>();
                              errorLabel.clearErrorMenssage();

                              // TODO: Criar lógica de criar um card e adicionar na coluna

                              /*projectsList.setNewColumn(
                                columnName: cardTitle.text,
                                boardId: '1',
                                columnDescription: columnDescription.text,
                                columnCreatedAt: date.toString(),
                                columnUpdatedAt: date.toString(),
                                columnWip: int.parse(columnWip.text));*/

                              Navigator.of(context).pop();
                            }
                          }),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    SizedBox(
                      height: 54,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: AppColors.blue),
                                borderRadius: BorderRadius.circular(
                                    AppMeasures.borderRadius)),
                            backgroundColor: AppColors.grey,
                          ),
                          child: const Text(
                            'Cancelar',
                            style: TextStyle(
                                color: Color(0xFF7398C8),
                                fontSize: 20,
                                fontWeight: FontWeight.w300),
                          ),
                          onPressed: () {
                            final errorLabel =
                                context.read<TextFieldController>();
                            if (errorLabel.errorInput != '') {
                              errorLabel.clearErrorMenssage();
                            }
                            Navigator.of(context).pop();
                          }),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      });
}
