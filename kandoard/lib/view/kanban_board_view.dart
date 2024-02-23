import 'package:flutter/material.dart';
import 'package:kandoard/components/add_card_dialog.dart';
import 'package:kandoard/components/add_column_dialog.dart';
import 'package:kandoard/model/board_model.dart';
import 'package:kandoard/provider/column_provider.dart';
import 'package:kandoard/shared/app_colors.dart';
import 'package:provider/provider.dart';

class KanbanBoardView extends StatefulWidget {
  const KanbanBoardView({super.key});
  static const routeName = '/kanban';

  @override
  State<KanbanBoardView> createState() => _KanbanBoardState();
}

class _KanbanBoardState extends State<KanbanBoardView> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final boardContent =
          ModalRoute.of(context)!.settings.arguments as BoardModel;

      Provider.of<ColumnProvider>(context, listen: false)
          .getColumns(boardContent.boardId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final boardContent =
        ModalRoute.of(context)!.settings.arguments as BoardModel;
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
          boardContent.boardName,
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
                  addColumnDialog(context, boardContent.boardId);
                }),
          ),
          Consumer<ColumnProvider>(
            builder: (context, value, child) {
              final columns = value.getColumnsList;
              if (value.isLoading) {
                return const CircularProgressIndicator();
              } else {
                return Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: columns.length,
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
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: Center(
                                                      child: Text(
                                                        columns[index]
                                                            .columnWip
                                                            .toString(),
                                                        style: TextStyle(
                                                            color:
                                                                AppColors.grey),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    columns[index].columnName,
                                                    style: TextStyle(
                                                        color: AppColors.blue,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w300),
                                                  ),
                                                ],
                                              ),
                                              IconButton(
                                                  onPressed: () async {
                                                    addCardDialog(context);
                                                    // final test = context
                                                    //     .read<ColumnProvider>();
                                                    // test.addNewCardToColumn();
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
                                                itemCount:
                                                    columns[index].cards.length,
                                                itemBuilder:
                                                    (context, indexCard) {
                                                  return Card(
                                                      clipBehavior:
                                                          Clip.hardEdge,
                                                      child: InkWell(
                                                        onTap: () {
                                                          print('Clicado');
                                                        },
                                                        onLongPress: () {
                                                          print(
                                                              'pressionado longamente');
                                                        },
                                                        child: SizedBox(
                                                            width: 375,
                                                            height: 80,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(
                                                                      10.0),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Text(
                                                                      columns[index]
                                                                          .cards[
                                                                              indexCard]
                                                                          .cardTitle,
                                                                      style: TextStyle(
                                                                          color: AppColors
                                                                              .grey,
                                                                          fontSize:
                                                                              20,
                                                                          fontWeight:
                                                                              FontWeight.w300)),
                                                                  const Icon(Icons
                                                                      .short_text)
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
                );
              }
            },
          )

        ],
      ),
    );
  }
}