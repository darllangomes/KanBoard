import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kandoard/components/custom_text_field.dart';
import 'package:kandoard/components/login_status_dialog.dart';
import 'package:kandoard/controller/textfield_controller.dart';
import 'package:kandoard/services/login_service.dart';
import 'package:kandoard/shared/app_colors.dart';
import 'package:kandoard/shared/app_measures.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  static const routeName = '/login';
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    TextFieldController textFieldController = TextFieldController();
    final _LoginformKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: AppColors.grey,
      body: Form(
        key: _LoginformKey,
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 26.0, right: 26),
              child: Column(
                children: [
                  Text.rich(TextSpan(children: [
                    TextSpan(
                        text: 'Login no ',
                        style: TextStyle(
                            color: AppColors.blue,
                            fontWeight: FontWeight.w300,
                            fontSize: 24)),
                    TextSpan(
                        text: 'KanBoard',
                        style: TextStyle(
                            color: AppColors.blue,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic,
                            fontSize: 24))
                  ])),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomTextField(
                    label: 'Email',
                    labelIcon: Icons.email,
                    keyboardInputType: TextInputType.emailAddress,
                    controller: textFieldController.emailController,
                    errorLabel: 'Digite seu email',
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  CustomTextField(
                    label: 'Senha',
                    labelIcon: Icons.password,
                    isObscureText: true,
                    controller: textFieldController.passwordController,
                    errorLabel: 'Digite sua senha',
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
    
                      },
                      child: Stack(
                        children: [
                          Text(
                            'Esqueci minha senha',
                            style: TextStyle(
                              color: AppColors.blue,
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                            ),
                          ),
                          Positioned(
                            bottom: 2,
                            left: 8,
                            right: 2,
                            child: Container(
                              height: 1,
                              color: AppColors.blue,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 56,
                    width: 196,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(AppMeasures.borderRadius))),
                        onPressed: () async {
                          if (_LoginformKey.currentState!.validate()) {
                            String email =
                                textFieldController.getEmailFromTextField();
                            String senha =
                                textFieldController.getPasswordFromTextField();

                            LoginStatus(context, 'Conectando...');
                            String loginStatus = await loginUser(
                                userEmail: email, userPassword: senha);

                            if (loginStatus.isNotEmpty) {
                              if (context.mounted) {
                                if (loginStatus == 'Login') {
                                  Navigator.popAndPushNamed(
                                      context, '/home');
                                } else {
                                  LoginStatus(context, loginStatus);
                                  Timer timer =
                                      Timer(Duration(milliseconds: 3500), () {
                                    Navigator.of(context, rootNavigator: true)
                                        .pop();
                                    Navigator.popAndPushNamed(
                                        context, '/login');
                                  });
                                }
                              }
                            }
                          }
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: AppColors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.w300),
                        )),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Não possui uma conta?',
                    style: TextStyle(
                        color: AppColors.blue,
                        fontSize: 16,
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
                                borderRadius: BorderRadius.circular(AppMeasures.borderRadius))),
                        onPressed: () =>
                            Navigator.popAndPushNamed(context, '/register'),
                        child: Text(
                          "Cadastrar",
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
  
}
