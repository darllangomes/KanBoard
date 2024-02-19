import 'package:flutter/material.dart';
import 'package:kandoard/shared/app_colors.dart';
import '../components/board_card.dart';

class WorkspaceView extends StatelessWidget {
  const WorkspaceView({super.key});
  static const routeName = '/workspace';

  @override
  Widget build(BuildContext context) {
    final workspaceName = ModalRoute.of(context)!.settings.arguments as String;

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
          workspaceName,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: AppColors.blue),
                    child: Row(
                      children: [
                        Icon(Icons.person_add_alt_1, color: AppColors.grey,),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Adicionar participantes',
                          style: TextStyle(color: AppColors.grey, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    onPressed: () {}),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add_box_outlined,
                      color: AppColors.blue,
                      size: 40,
                    )),
              ],
            ),
            const SizedBox(height: 42,),
            BoardCard(boardName: 'Teste'),
            // Consumer<BoardRepository>(builder: (context, value, child) {
            //   return Expanded(
            //     child: ListView.builder(
            //       itemCount: value.getBoardList(projectCard.projectId).length,
            //       itemBuilder: (context, index) {
            //         return Padding(
            //           padding: const EdgeInsets.only(bottom: 50),
            //           child: BoardCart(
            //             boardName: value
            //                 .getBoardList(projectCard.projectId)[index]
            //                 .getBoardName,
            //             cardContent:
            //                 value.getBoardList(projectCard.projectId)[index],
            //           ),
            //         );
            //       },
            //     ),
            //   );
            // }),

          ],
        )),
      ),
    );
  }
}
