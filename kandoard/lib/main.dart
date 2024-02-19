import 'package:flutter/material.dart';
import 'package:kandoard/controller/textfield_controller.dart';
import 'package:kandoard/provider/workspace_provider.dart';
import 'package:kandoard/repositories/board_repository.dart';
import 'package:kandoard/shared/app_colors.dart';
import 'package:kandoard/view/board_view.dart';
import 'package:kandoard/view/project_view.dart';
import 'package:kandoard/view/login_view.dart';
import 'package:kandoard/view/workspace_view.dart';
import 'package:kandoard/view/register_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => TextFieldController()),
      ChangeNotifierProvider(
        create: (context) => BoardRepository(),
      ),
      ChangeNotifierProvider(create: (context) => WorkspaceProvider())
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
        WorkspaceView.routeName: (context) => const WorkspaceView(),
        KanbanBoardView.routeName: (context) => const KanbanBoardView(),
        Board.routeName:(context) => const Board(),
      },
    );
  }
}
