import 'package:flutter/material.dart';
import 'package:kandoard/model/board_model.dart';
import 'package:kandoard/provider/card_provider.dart';
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

      Provider.of<CardProvider>(context, listen: false).getCardsList();
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
                  //TODO: Adicionar Modal de criaçã de coluna
                  final date = DateTime.now();
                  final setColumn = context.read<ColumnProvider>();
                  setColumn.setNewColumn(
                      columnName: 'Novo Novo',
                      boardId: boardContent.boardId,
                      columnDescription: '',
                      columnCreatedAt: date.toString(),
                      columnUpdatedAt: date.toString(),
                      columnWip: 5);

                  print('Adicionar Coluna');
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
                                                    print('adicionar cartao');
                                                    // final test = CardService();
                                                    // final t = await test
                                                    //     .getAllCards();
                                                    // print(t[0].cardActivity[0]);
                                                    // print(t[0].cardActivity[0]
                                                    //     ['date']);
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
                                          Consumer<CardProvider>(
                                              builder: (context, value, child) {
                                            final cards = value.getCards;
                                            if (value.isCardListLoading) {
                                              return const Column(
                                                children: [
                                                  Center(
                                                      child:
                                                          CircularProgressIndicator())
                                                ],
                                              );
                                            } else {
                                              return Expanded(
                                                child: ListView.builder(
                                                    shrinkWrap: true,
                                                    itemCount: cards.length,
                                                    itemBuilder:
                                                        (context, index) {
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
                                                                          cards[index]
                                                                              .getcardTitle,
                                                                          style: TextStyle(
                                                                              color: AppColors.grey,
                                                                              fontSize: 20,
                                                                              fontWeight: FontWeight.w300)),
                                                                      const Icon(
                                                                          Icons
                                                                              .short_text)
                                                                    ],
                                                                  ),
                                                                )),
                                                          ));
                                                    }),
                                              );
                                            }
                                          })

                                          //Lista de cards Termina aqui
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

          //Lista de colunas Termina Aqui
        ],
      ),
    );
  }
}

// Expanded(
//             child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: 5,
//                 shrinkWrap: true,
//                 itemBuilder: ((context, index) {
//                   return Center(
//                     child: Padding(
//                       padding: const EdgeInsets.only(
//                           top: 40, left: 30, right: 20, bottom: 30),
//                       child: Card(
//                           color: AppColors.grey,
//                           elevation: 0,
//                           shape: RoundedRectangleBorder(
//                               side: BorderSide(
//                                 color: AppColors.blue,
//                               ),
//                               borderRadius: BorderRadius.circular(20)),
//                           child: SizedBox(
//                               width: 375,
//                               child: Padding(
//                                 padding: const EdgeInsets.all(20.0),
//                                 child: Column(
//                                   children: [
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Row(
//                                           children: [
//                                             Container(
//                                               width: 30,
//                                               height: 30,
//                                               decoration: BoxDecoration(
//                                                   color: AppColors.blue,
//                                                   borderRadius:
//                                                       BorderRadius.circular(5)),
//                                               child: Center(
//                                                 child: Text(
//                                                   '2',
//                                                   style: TextStyle(
//                                                       color: AppColors.grey),
//                                                 ),
//                                               ),
//                                             ),
//                                             const SizedBox(
//                                               width: 10,
//                                             ),
//                                             Text(
//                                               'Nome da Coluna',
//                                               style: TextStyle(
//                                                   color: AppColors.blue,
//                                                   fontSize: 20,
//                                                   fontWeight: FontWeight.w300),
//                                             ),
//                                           ],
//                                         ),
//                                         IconButton(
//                                             onPressed: () {
//                                               print('adicionar cartao');
//                                             },
//                                             icon: Icon(
//                                               Icons.add_box_outlined,
//                                               size: 40,
//                                               color: AppColors.blue,
//                                             ))
//                                       ],
//                                     ),
//                                     const SizedBox(
//                                       height: 20,
//                                     ),
//                                     Expanded(
//                                       child: ListView.builder(
//                                           shrinkWrap: true,
//                                           itemCount: 10,
//                                           itemBuilder: (context, index) {
//                                             return Card(
//                                               clipBehavior: Clip.hardEdge,
//                                                 child: InkWell(
//                                               onTap: () {
//                                                 ColumnService sv = ColumnService();
//                                                 sv.getAllColums();
//                                                 print('Clicado');
//                                               },
//                                               onLongPress: () {
//                                                 print('pressionado longamente');
//                                               },
//                                               child: SizedBox(
//                                                   width: 375,
//                                                   height: 80,
//                                                   child: Padding(
//                                                     padding:
//                                                         const EdgeInsets.all(
//                                                             10.0),
//                                                     child: Column(
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .start,
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceEvenly,
//                                                       children: [
//                                                         Text('Nome da Tarefa',
//                                                             style: TextStyle(
//                                                                 color: AppColors
//                                                                     .grey,
//                                                                 fontSize: 20,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .w300)),
//                                                         Icon(Icons.short_text)
//                                                       ],
//                                                     ),
//                                                   )),
//                                             ));
//                                           }),
//                                     )
//                                   ],
//                                 ),
//                               ))),
//                     ),
//                   );
//                 })),
//           ),