import 'package:flutter/material.dart';
import 'package:kandoard/controller/textfield_controller.dart';
import 'package:kandoard/repositories/ProjectRepository.dart';
import 'package:kandoard/shared/app_colors.dart';
import 'package:kandoard/view/kanban_board_view.dart';
import 'package:kandoard/view/login_view.dart';
import 'package:kandoard/view/projects_view.dart';
import 'package:kandoard/view/register_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ProjectRepository(),
      ),
      ChangeNotifierProvider(create: (context) => TextFieldController())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KanBoard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.blue),
        useMaterial3: true,
      ),
      initialRoute: LoginView.routeName,
      routes: {
        LoginView.routeName: (context) => const LoginView(),
        RegisterView.routeName: (context) => const RegisterView(),
        ProjectsView.routeName: (context) => const ProjectsView(),
        KanbanBoardView.routeName: (context) => const KanbanBoardView(),
      },
    );
  }
}
