import 'package:flutter/material.dart';
import 'package:kandoard/model/board_model.dart';
import 'package:kandoard/shared/app_colors.dart';

class KanbanBoardView extends StatefulWidget {
  const KanbanBoardView({super.key});
  static const routeName = '/kanban';

  @override
  State<KanbanBoardView> createState() => _KanbanBoardState();
}

class _KanbanBoardState extends State<KanbanBoardView> {
  @override
  Widget build(BuildContext context) {
    final boardCard = ModalRoute.of(context)!.settings.arguments as BoardModel;
    return Scaffold(
        backgroundColor: AppColors.grey,
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppColors.white),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
          actionsIconTheme: IconThemeData(),
          title: Text(
            boardCard.getBoardName,
            style: const TextStyle(
                color: Color(0xFFD9D9D9),
                fontSize: 24,
                fontWeight: FontWeight.w200,
                fontStyle: FontStyle.italic),
          ),
          backgroundColor: AppColors.blue,
        ),
        body: const Placeholder());
  }
}
