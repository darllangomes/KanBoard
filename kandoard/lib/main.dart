import 'package:flutter/material.dart';
import 'package:kandoard/controller/textfield_controller.dart';
import 'package:kandoard/provider/board_provider.dart';
import 'package:kandoard/provider/column_provider.dart';
import 'package:kandoard/provider/member_provider.dart';
import 'package:kandoard/provider/user_provider.dart';
import 'package:kandoard/provider/workspace_provider.dart';
import 'package:kandoard/shared/app_colors.dart';
import 'package:kandoard/view/chart_view.dart';
import 'package:kandoard/view/kanban_board_view.dart';
import 'package:kandoard/view/workspace_view.dart';
import 'package:kandoard/view/login_view.dart';
import 'package:kandoard/view/home_view.dart';
import 'package:kandoard/view/register_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => TextFieldController()),
      ChangeNotifierProvider(create: (context) => WorkspaceProvider()),
      ChangeNotifierProvider(create: (context) => BoardProvider()),
      ChangeNotifierProvider(create: (context) => ColumnProvider()),
      ChangeNotifierProvider(create: (context) => UserProvider()),
      ChangeNotifierProvider(create: (context) => MemberProvider()),  
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
        HomeView.routeName: (context) => const HomeView(),
        KanbanBoardView.routeName: (context) => const KanbanBoardView(),
        WorkspaceView.routeName:(context) => const WorkspaceView(),
        ChartView.routeName:(context) => const ChartView(),
      },
    );
  }
}
