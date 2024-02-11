import 'package:flutter/material.dart';
import 'package:kandoard/components/custom_text_field.dart';
import 'package:kandoard/controller/textfield_controller.dart';
import 'package:kandoard/shared/app_colors.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static const routeName = '/register';

  @override
  Widget build(BuildContext context) {
    final TextFieldController textFieldController = TextFieldController();

    return Scaffold(
      backgroundColor: AppColors.grey,
      body: Center(
        child: SingleChildScrollView(
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
              ),
              CustomTextField(
                label: "Email",
                labelIcon: Icons.email,
                keyboardInputType: TextInputType.emailAddress,
                controller: textFieldController.emailController,
              ),
              CustomTextField(
                label: "Senha",
                labelIcon: Icons.password,
                isObscureText: true,
                controller: textFieldController.passwordController,
              ),
              CustomTextField(
                label: "Confirmar Senha",
                labelIcon: Icons.password,
                isObscureText: true,
                controller: textFieldController.emailController,
              ),
              const SizedBox(
                height: 20,
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
                      print("pressed");
                      String nome = textFieldController.getGenericTextFromTextField();
                      String email = textFieldController.getEmailFromTextField();
                      String senha = textFieldController.getPasswordFromTextField();
                      print("$nome, $email, $senha");
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
    );
  }
}
