import 'package:flutter/material.dart';
import 'package:kandoard/shared/app_colors.dart';
import 'package:kandoard/view/login_view.dart';
import 'package:kandoard/view/register_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KanBoard',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.blue),
        useMaterial3: true,
      ),
      initialRoute: LoginView.routeName,
      routes: {
        LoginView.routeName:(context) => const LoginView(),
        RegisterView.routeName:(context) => const RegisterView(),
      },
      
    );
  }
}
