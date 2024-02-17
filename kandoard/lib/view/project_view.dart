import 'package:flutter/material.dart';
import 'package:kandoard/model/workspace_model.dart';
import 'package:kandoard/repositories/board_repository.dart';
import 'package:kandoard/shared/app_colors.dart';
import 'package:provider/provider.dart';
import '../components/board_card.dart';

class KanbanBoardView extends StatelessWidget {
  const KanbanBoardView({super.key});
  static const routeName = '/kanban';

  @override
  Widget build(BuildContext context) {
    final projectCard =
        ModalRoute.of(context)!.settings.arguments as ProjectModel;

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
          projectCard.nameProject,
          style: const TextStyle(
              color: Color(0xFFD9D9D9),
              fontSize: 24,
              fontWeight: FontWeight.w200,
              fontStyle: FontStyle.italic),
        ),
        backgroundColor: AppColors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
            child: Column(
          children: [
            const Row(
              children: [
                Text(
                  'test',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  'test',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Consumer<BoardRepository>(builder: (context, value, child) {
              return Expanded(
                child: ListView.builder(
                  itemCount: value.getBoardList(projectCard.projectId).length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: BoardCart(
                        boardName: value
                            .getBoardList(projectCard.projectId)[index]
                            .getBoardName,
                        cardContent:
                            value.getBoardList(projectCard.projectId)[index],
                      ),
                    );
                  },
                ),
              );
            }),
          ],
        )),
      ),
    );
  }
}
