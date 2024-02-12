import 'package:flutter/material.dart';
import 'package:kandoard/model/ProjectModel.dart';
import 'package:kandoard/shared/app_colors.dart';

class KanbanBoardView extends StatelessWidget {
  const KanbanBoardView({super.key});
  static const routeName = '/kanban';

  @override
  Widget build(BuildContext context) {
    final card = ModalRoute.of(context)!.settings.arguments as ProjectModel;

    return Scaffold(
        backgroundColor: AppColors.grey,
        
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppColors.white),
          leading: IconButton(onPressed: (){
            Navigator.popAndPushNamed(context, '/projetos');
          }, icon: const Icon(Icons.arrow_back)),
          actionsIconTheme: IconThemeData(),
          title: Text(
            card.nameProject,
            style: const TextStyle(
                color: Color(0xFFD9D9D9),
                fontSize: 24,
                fontWeight: FontWeight.w200,
                fontStyle: FontStyle.italic),
          ),
          backgroundColor: AppColors.blue,
        ),
        body: Center(
          child: Text('test', style: TextStyle(color: Colors.white),),
        ));
  }
}
