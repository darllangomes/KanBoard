import 'package:flutter/material.dart';
import 'package:kandoard/controller/textfield_controller.dart';
import 'package:kandoard/provider/column_provider.dart';
import 'package:kandoard/shared/app_colors.dart';
import 'package:kandoard/shared/app_measures.dart';
import 'package:provider/provider.dart';

Future<void> addCardDialog(BuildContext context) {
  final columnName = TextEditingController();
  final columnDescription = TextEditingController();
  final columnWip = TextEditingController();

  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.grey,
          title: const Text(
            'Adicionar Coluna',
            style: TextStyle(color: Color(0xFF7398C8)),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Consumer<TextFieldController>(
                  builder: (context, errorValue, child) {
                return Column(
                  children: [
                    TextFormField(
                      style: TextStyle(color: AppColors.white),
                      controller: columnName,
                      decoration: InputDecoration(
                        errorText: errorValue.errorInput['name'] == ''
                            ? null
                            : errorValue.errorInput['name'],
                        labelText: 'Nome da coluna',
                        labelStyle: TextStyle(
                          color: AppColors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(AppMeasures.borderRadius)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      style: TextStyle(color: AppColors.white),
                      controller: columnDescription,
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
                            borderRadius: BorderRadius.circular(AppMeasures.borderRadius)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      style: TextStyle(color: AppColors.white),
                      controller: columnWip,
                      decoration: InputDecoration(
                        errorText: errorValue.errorInput['wip'] == ''
                            ? null
                            : errorValue.errorInput['wip'],
                        labelText: 'Work in Progress',
                        labelStyle: TextStyle(
                          color: AppColors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(AppMeasures.borderRadius)),
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
                              borderRadius: BorderRadius.circular(AppMeasures.borderRadius)),
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
                          if (columnName.text.isEmpty) {
                            errorLabel.setErrorMenssage(
                                'Digite um nome para a coluna', 'name');
                          } else if (columnName.text.length < 3) {
                            errorLabel.setErrorMenssage(
                                'Digite ao menos 3 caracteres', 'name');
                          } else {
                            final date = DateTime.now();
                            final projectsList = context.read<ColumnProvider>();
                            errorLabel.clearErrorMenssage();

                            projectsList.setNewColumn(
                                columnName: columnName.text,
                                boardId: '1',
                                columnDescription: columnDescription.text,
                                columnCreatedAt: date.toString(),
                                columnUpdatedAt: date.toString(),
                                columnWip: int.parse(columnWip.text));

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
                              borderRadius: BorderRadius.circular(AppMeasures.borderRadius)),
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
        );
      });
}
