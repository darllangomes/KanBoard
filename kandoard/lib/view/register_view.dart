import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kandoard/components/custom_text_field.dart';
import 'package:kandoard/controller/textfield_controller.dart';
import 'package:kandoard/shared/app_colors.dart';
import '../services/register_service.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});
  static const routeName = '/register';

  @override
  RegisterViewState createState() {
    return RegisterViewState();
  }
}

class RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    final TextFieldController textFieldController = TextFieldController();
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: AppColors.grey,
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 26.0, right: 26),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text.rich(TextSpan(children: [
                    TextSpan(
                        text: 'Cadastro no ',
                        style: TextStyle(
                            color: Color(0xFF7398C8),
                            fontWeight: FontWeight.w300,
                            fontSize: 24)),
                    TextSpan(
                        text: 'KanBoard',
                        style: TextStyle(
                            color: Color(0xFF7398C8),
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic,
                            fontSize: 24))
                  ])),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomTextField(
                    label: "Nome",
                    labelIcon: Icons.person,
                    keyboardInputType: TextInputType.name,
                    controller: textFieldController.genericTextController,
                    errorLabel: 'Digite um nome',
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  CustomTextField(
                    label: "Email",
                    labelIcon: Icons.email,
                    keyboardInputType: TextInputType.emailAddress,
                    controller: textFieldController.emailController,
                    errorLabel: 'Digite um email',
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  CustomTextField(
                    label: "Senha",
                    labelIcon: Icons.password,
                    keyboardInputType: TextInputType.text,
                    isObscureText: true,
                    controller: textFieldController.passwordController,
                    errorLabel: 'Digite uma senha',
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  CustomTextField(
                    label: "Confirmar Senha",
                    labelIcon: Icons.password,
                    keyboardInputType: TextInputType.text,
                    isObscureText: true,
                    controller: textFieldController.passwordConfirmController,
                    errorLabel: 'Digite sua senha anterior',
                  ),
                  const SizedBox(
                    height: 37,
                  ),
                  SizedBox(
                    height: 56,
                    width: 196,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            String nome = textFieldController
                                .getGenericTextFromTextField();
                            String email =
                                textFieldController.getEmailFromTextField();
                            String senha =
                                textFieldController.getPasswordFromTextField();

                            RegisterStatus(context, 'Carregando...');

                            String statusRegister = await registerUser(
                                userName: nome,
                                userEmail: email,
                                userPassword: senha);
                            // TODO: Utilizar o shared_preferences

                            if (statusRegister.isNotEmpty) {
                              //TODO: Adicionar um future para mostrar carregamento enquanto espera algum retorno do servidor

                              

                              if (context.mounted) {
                                RegisterStatus(context, statusRegister);
                                Timer timer =
                                    Timer(const Duration(milliseconds: 3500), () {
                                  Navigator.of(context, rootNavigator: true)
                                      .pop();
                                  Navigator.popAndPushNamed(context, '/login');
                                });
                              }
                            }
                          }
                        },
                        child: Text(
                          "Cadastrar",
                          style: TextStyle(
                              color: AppColors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w300),
                        )),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    'Já possui uma conta?',
                    style: TextStyle(
                        color: Color(0XFFD9D9D9),
                        fontSize: 20,
                        fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 56,
                    width: 196,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.grey,
                            side: BorderSide(color: AppColors.blue),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onPressed: () =>
                            Navigator.popAndPushNamed(context, '/login'),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: AppColors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.w300),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //TODO: separar esse widget em outra página
  Future<void> RegisterStatus(BuildContext context, String message) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
              backgroundColor: AppColors.grey,
              title: Text(
                message.toString(),
                style: TextStyle(color: Color(0xFF7398C8)),
              ));
        });
  }
}
