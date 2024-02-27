import 'package:flutter/material.dart';
import 'package:kandoard/controller/textfield_controller.dart';
import 'package:kandoard/model/member_model.dart';
import 'package:kandoard/model/user_model.dart';
import 'package:kandoard/provider/member_provider.dart';
import 'package:kandoard/provider/user_provider.dart';
import 'package:kandoard/shared/app_colors.dart';
import 'package:kandoard/shared/app_measures.dart';
import 'package:provider/provider.dart';
import 'package:test/test.dart';

Future<void> addMemberDialog(BuildContext context, List<User> arrayUsers,List<MemberModel> arrayMembers, MemberProvider memberProvider, String workspaceId ) async {
  final name = TextEditingController();
  final users = await arrayUsers;
  final members = await arrayMembers;
  print('users: $users');
  print('members: $members');



  return showDialog(
    context: context,
    builder: (BuildContext context) {
       if(context.mounted){
     return AlertDialog(
        backgroundColor: AppColors.grey,
        title: const Text(
          'Adicionar Membro',
          style: TextStyle(color: Color(0xFF7398C8)),
        ),
        content: Consumer<TextFieldController>(
          builder: (context, errorValue, child) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Autocomplete<String>(
                   optionsBuilder: (TextEditingValue textEditingValue) {
    final String query = textEditingValue.text.toLowerCase();
    return users
        .where((user) => user.getUserEmail.toLowerCase().contains(query))
        .map((user) => user.getUserEmail)
        .toList();
  },
  onSelected: (String selectedEmail) {
    print('Email selecionado: $selectedEmail');
    name.text = selectedEmail;
  },),
                    /* TextFormField(
                      style: TextStyle(color: AppColors.white),
                      controller: name,
                      decoration: InputDecoration(
                        errorText: errorValue.errorInput['name'] == ''
                            ? null
                            : errorValue.errorInput['name'],
                        labelText: 'Nome do Membro',
                        labelStyle: TextStyle(
                          color: AppColors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppMeasures.borderRadius),
                        ),
                      ),
                    ), */
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
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
                            borderRadius: BorderRadius.circular(AppMeasures.borderRadius),
                          ),
                          backgroundColor: AppColors.blue,
                        ),
                        child: const Text(
                          'Criar',
                          style: TextStyle(
                            color: Color.fromARGB(255, 52, 52, 52),
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        onPressed: () {
                          final errorLabel = context.read<TextFieldController>();
                          var isAlreadyInMembers = false;
                          members.forEach((element) { element.getUserEmail == name.text ? isAlreadyInMembers = true :  isAlreadyInMembers = false; });
                          if (name.text.isEmpty) {
                            errorLabel.setErrorMenssage(
                                'Digite um nome para a coluna', 'name');
                          } else if (name.text.length < 3) {
                            errorLabel.setErrorMenssage(
                                'Digite ao menos 3 caracteres', 'name');
                          } else if(isAlreadyInMembers){
                               errorLabel.setErrorMenssage(
                                'Esse usuário já está no time', 'name');
                          } else{
                            // lógica de adcionar
                            var userId = '-1';
                              users.forEach((element) {element.getUserEmail == name.text ? userId = element.getUserId : userId = '-1';});
                              memberProvider.addMembers(workspaceId,"admin",userId);
                              print('userId: ${ userId}');
                          }
                        },
                      ),
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
                            borderRadius: BorderRadius.circular(AppMeasures.borderRadius),
                          ),
                          backgroundColor: AppColors.grey,
                        ),
                        child: const Text(
                          'Cancelar',
                          style: TextStyle(
                            color: Color(0xFF7398C8),
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        onPressed: () {
                          final errorLabel = context.read<TextFieldController>();
                          if (errorLabel.errorInput != '') {
                            errorLabel.clearErrorMenssage();
                          }
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      );
  }else{
    throw 'Erro ao renderizar dialog';
  }
    },
  );
}