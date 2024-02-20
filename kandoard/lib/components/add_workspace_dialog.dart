import 'package:flutter/material.dart';
import 'package:kandoard/controller/textfield_controller.dart';
import 'package:kandoard/shared/app_colors.dart';
import 'package:provider/provider.dart';

import '../provider/workspace_provider.dart';

Future<void> addProjectDialog(BuildContext context, String workspaceName) {
  final projectBoard = TextEditingController();
  final projectDescription = TextEditingController();
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.grey,
          title: const Text(
            'Criar Novo Projeto',
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
                      controller: projectBoard,
                      decoration: InputDecoration(
                        errorText: errorValue.errorInput.isEmpty
                            ? null
                            : errorValue.errorInput,
                        labelText: 'Nome do Projeto',
                        labelStyle: TextStyle(
                          color: AppColors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      style: TextStyle(color: AppColors.white),
                      controller: projectDescription,
                      decoration: InputDecoration(
                        labelText: 'Descrição',
                        labelStyle: TextStyle(
                          color: AppColors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
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
                              borderRadius: BorderRadius.circular(20)),
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
                          if (projectBoard.text.isEmpty) {
                            errorLabel.setErrorMenssage(
                                'Digite um nome para o Projeto');
                          } else {
                            final projectsList =
                                        context.read<WorkspaceProvider>();
                                    errorLabel.setErrorMenssage('');

                                    projectsList.addBoardToWorkspace(workspaceName);

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
                              borderRadius: BorderRadius.circular(20)),
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
                            errorLabel.setErrorMenssage('');
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
