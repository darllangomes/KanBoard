import 'package:flutter/material.dart';
import 'package:kandoard/controller/textfield_controller.dart';
import 'package:kandoard/provider/board_provider.dart';
import 'package:kandoard/shared/app_colors.dart';
import 'package:kandoard/shared/app_measures.dart';
import 'package:provider/provider.dart';

Future<void> addBoardDialog(BuildContext context, String workspaceId) {
  final nameBoard = TextEditingController();
  final boardDescription = TextEditingController();
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.grey,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppMeasures.borderRadius)),
          title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Criar Novo Quadro',
                          style:
                              TextStyle(color: AppColors.blue, fontSize: 20)),
                          IconButton(
                              onPressed: () {
                                 final errorLabel =
                                context.read<TextFieldController>();
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
          
          
         
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Consumer<TextFieldController>(
                  builder: (context, errorValue, child) {
                return Column(
                  children: [
                    TextFormField(
                      style: TextStyle(color: AppColors.blue),
                      controller: nameBoard,
                      decoration: InputDecoration(
                        errorText: errorValue.errorInput['name'] == ''
                            ? null
                            : errorValue.errorInput['name'],
                        labelText: 'Nome do quadro',
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
                      style: TextStyle(color: AppColors.blue),
                      controller: boardDescription,
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
                  ],
                );
              }),
              const SizedBox(height: 40),
              Row(
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
                        child: Text(
                          'Criar',
                          style: TextStyle(
                              color: AppColors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.w300),
                        ),
                        onPressed: () {
                          final addBoard = context.read<BoardProvider>();
                          // TODO: tirar essa lógica daqui de dentro
                          //TODO: adicionar logica de que não pode adicionar dois boards com mesmo nome
                          final errorLabel =
                              context.read<TextFieldController>();
                          if (nameBoard.text.isEmpty) {
                            errorLabel.clearErrorMenssage();
                            errorLabel.setErrorMenssage(
                                'Digite um nome para o quadro', 'name');
                          } else if (nameBoard.text.length < 3) {
                            errorLabel.clearErrorMenssage();
                            errorLabel.setErrorMenssage(
                                'Digite ao menos 3 caracteres', 'name');
                          } else if (boardDescription.text.isEmpty){
                            errorLabel.clearErrorMenssage();
                            errorLabel.setErrorMenssage(
                                'Digite uma descrição para o quadro', 'description');
                          }
                          else {
                            errorLabel.clearErrorMenssage();

                            addBoard.setNewBoard(
                                boardName: nameBoard.text,
                                boardDescription: boardDescription.text,
                                workspaceId: workspaceId);

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
        );
      });
}
