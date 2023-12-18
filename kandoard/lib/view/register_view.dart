import 'package:flutter/material.dart';
import 'package:kandoard/components/custom_text_field.dart';
import 'package:kandoard/shared/app_colors.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static const routeName = '/register';
  

  @override
  Widget build(BuildContext context) {
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
              const CustomTextField(
                label: "Nome",
                labelIcon: Icons.person,
              ),
              const CustomTextField(
                label: "Email",
                labelIcon: Icons.email,
              ),
              const CustomTextField(
                label: "Senha",
                labelIcon: Icons.password,
              ),
              const CustomTextField(
                label: "Confirmar Senha",
                labelIcon: Icons.password,
              ),
              const SizedBox(height: 20,),
              SizedBox(
                height: 56,
                width: 196,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () {},
                    child: Text("Cadastrar", style: TextStyle(color: AppColors.white, fontSize: 20, fontWeight: FontWeight.w300),)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
