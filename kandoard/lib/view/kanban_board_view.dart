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
    final boardCard = ModalRoute.of(context)!.settings.arguments as String;
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
            boardCard,
            style: TextStyle(
                color: AppColors.white,
                fontSize: 24,
                fontWeight: FontWeight.w200,
                fontStyle: FontStyle.italic),
          ),
          backgroundColor: AppColors.blue,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
            child: Card(
                color: AppColors.grey,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: AppColors.blue,
                    ),
                    borderRadius: BorderRadius.circular(20)),
                child: SizedBox(
                    width: 375,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Nome da Coluna',
                                style: TextStyle(color: AppColors.blue, fontSize: 20, fontWeight: FontWeight.w300),
                              ),
                              CircleAvatar(
                                backgroundColor: AppColors.blue,
                                child: Text('2', style: TextStyle(color: AppColors.grey),),
                              )
                            ],
                          ),

                          const SizedBox(height: 20,),

                          Card(child: SizedBox(width: 300, child: Text('Tarefa')),)
                        ],

                        
                      ),
                    ))),
          ),
        ));
  }
}
