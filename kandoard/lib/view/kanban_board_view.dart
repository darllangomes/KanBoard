import 'package:flutter/material.dart';
import 'package:kandoard/components/add_card_dialog.dart';
import 'package:kandoard/components/add_column_dialog.dart';
import 'package:kandoard/components/view_card_content_dialog.dart';
import 'package:kandoard/controller/card_color_controller.dart';
import 'package:kandoard/controller/column_color_controller.dart';
import 'package:kandoard/model/board_model.dart';
import 'package:kandoard/provider/column_provider.dart';
import 'package:kandoard/shared/app_colors.dart';
import 'package:kandoard/shared/app_measures.dart';
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
        iconTheme: IconThemeData(color: AppColors.grey),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        actionsIconTheme: const IconThemeData(),
        title: Text(
          boardContent.boardName,
          style: TextStyle(
              color: AppColors.grey,
              fontSize: 24,
              fontWeight: FontWeight.w200,
              fontStyle: FontStyle.italic),
        ),
        backgroundColor: AppColors.blue,
        actions: [IconButton(onPressed: (){Navigator.pushNamed(context, '/charts');}, icon: Icon(Icons.bar_chart, color: AppColors.grey,))]
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(AppMeasures.borderRadius)),
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
                return const Center(child: CircularProgressIndicator());
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
                                      color: columnColor(
                                          columns[index].columnWip,
                                          columns[index].cards.length),
                                    ),
                                    borderRadius: BorderRadius.circular(
                                        AppMeasures.borderRadius)),
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
                                                        color: columnColor(
                                                            columns[index]
                                                                .columnWip,
                                                            columns[index]
                                                                .cards
                                                                .length),
                                                        borderRadius: BorderRadius
                                                            .circular(AppMeasures
                                                                .borderRadius)),
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
                                                    addCardDialog(context, columns[index].getColumnId);
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
                                                  final cards =
                                                      columns[index].cards;
                                                  return Card(
                                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppMeasures.borderRadius)),
                                                      color: cardColor(
                                                          cards[indexCard]
                                                              .cardPriority),
                                                      clipBehavior:
                                                          Clip.hardEdge,
                                                      child: InkWell(
                                                        onTap: () {
                                                          //TODO: abrir tela que mostra as informacoes do card, e as opçoes de editar e excluir
                                                          ViewCardContent(context, card: columns[index].cards[indexCard]);
                                                          print('Clicado');
                                                        },
                                                        onLongPress: () {
                                                          if (columns[index] !=
                                                              columns.last) {
                                                            if (cards[indexCard]
                                                                    .isPressed ==
                                                                false) {
                                                              cards[indexCard]
                                                                  .setPressed(
                                                                      true);
                                                            } else {
                                                              cards[indexCard]
                                                                  .setPressed(
                                                                      false);
                                                            }

                                                            setState(() {});
                                                          }
                                                        },
                                                        child: SizedBox(
                                                            width: 375,
                                                            height: 80,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(
                                                                      10.0),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    children: [
                                                                      Text(
                                                                          cards[indexCard]
                                                                              .cardTitle,
                                                                          style: TextStyle(
                                                                              color: AppColors.grey,
                                                                              fontSize: 20,
                                                                              fontWeight: FontWeight.w300)),
                                                                      const Icon(
                                                                          Icons
                                                                              .short_text),
                                                                    ],
                                                                  ),
                                                                  cards[indexCard]
                                                                          .isPressed
                                                                      ? IconButton(
                                                                          onPressed:
                                                                              () {
                                                                            final switchCardColumn =
                                                                                context.read<ColumnProvider>();
                                                                            cards[indexCard].setPressed(false);
                                                                            setState(() {});
                                                                            switchCardColumn.changeCardtoNextColumn(
                                                                                card: cards[indexCard],
                                                                                indexCard: indexCard);
                                                                          },
                                                                          icon: const Icon(Icons
                                                                              .arrow_forward))
                                                                      : IconButton(
                                                                          onPressed:
                                                                              () {},
                                                                          color: Colors
                                                                              .transparent,
                                                                          icon:
                                                                              Icon(Icons.arrow_forward))
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
