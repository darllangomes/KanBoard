import 'package:flutter/material.dart';
import 'package:kandoard/components/custom_text_field.dart';
import 'package:kandoard/shared/app_colors.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  static const routeName = '/login';
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'Login no ',
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
                height: 25,
              ),
              const CustomTextField(label: 'Email', labelIcon: Icons.email),
              const CustomTextField(label: 'Senha', labelIcon: Icons.password),
              Container(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Stack(
                    children: [
                      const Text(
                        'Esqueci minha senha',
                        style: TextStyle(
                          color: Color(0xFF7398C8),
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
                          color: const Color(0xFF7398C8),
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
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () {},
                    child: Text(
                      "Login",
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
                'Não possui uma conta?',
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
                  key: const Key('botaoCadastro'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        side: BorderSide(color: AppColors.blue),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
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
    );
  }
}
