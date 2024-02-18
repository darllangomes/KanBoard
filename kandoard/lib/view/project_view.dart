import 'package:flutter/material.dart';
import 'package:kandoard/components/add_board_dialog.dart';
import 'package:kandoard/model/ProjectModel.dart';
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
        title: Center(
            child: Text(
          projectCard.nameProject,
          style: const TextStyle(
              color: Color(0xFFD9D9D9),
              fontSize: 24,
              fontWeight: FontWeight.w200,
              fontStyle: FontStyle.italic),
        )),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.menu))],
        backgroundColor: AppColors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.person_add_alt_1_outlined),
                  label: const Text('Adicionar participantes'),
                ),
                IconButton(
                  color: Colors.orangeAccent,
                  onPressed: () => addBoardDialog(context),
                  icon: const Icon(Icons.add_box_outlined),
                ),
              ],
            ),
            const SizedBox(height: 20),
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
