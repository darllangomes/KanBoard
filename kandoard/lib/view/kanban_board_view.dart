import 'package:flutter/material.dart';
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
        actionsIconTheme: const IconThemeData(),
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: AppColors.blue),
                child: Row(
                  children: [
                    Icon(
                      Icons.add,
                      color: AppColors.grey,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Adicionar Colunas',
                      style: TextStyle(
                          fontSize: 18,
                          color: AppColors.grey,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                onPressed: () {
                  print('Adicionar Coluna');
                }),
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder: ((context, index) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 40, left: 30, right: 20, bottom: 30),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  color: AppColors.blue,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Center(
                                                child: Text(
                                                  '2',
                                                  style: TextStyle(
                                                      color: AppColors.grey),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'Nome da Coluna',
                                              style: TextStyle(
                                                  color: AppColors.blue,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                          ],
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              print('adicionar cartao');
                                            },
                                            icon: Icon(
                                              Icons.add_box_outlined,
                                              size: 40,
                                              color: AppColors.blue,
                                            ))
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: 10,
                                          itemBuilder: (context, index) {
                                            return Card(
                                              clipBehavior: Clip.hardEdge,
                                                child: InkWell(
                                              onTap: () {
                                                print('Clicado');
                                              },
                                              onLongPress: () {
                                                print('pressionado longamente');
                                              },
                                              child: SizedBox(
                                                  width: 375,
                                                  height: 80,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Text('Nome da Tarefa',
                                                            style: TextStyle(
                                                                color: AppColors
                                                                    .grey,
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300)),
                                                        Icon(Icons.short_text)
                                                      ],
                                                    ),
                                                  )),
                                            ));
                                          }),
                                    )
                                  ],
                                ),
                              ))),
                    ),
                  );
                })),
          ),
        ],
      ),
    );
  }
}
