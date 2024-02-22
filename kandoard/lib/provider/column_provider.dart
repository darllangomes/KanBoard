import 'package:flutter/material.dart';
import 'package:kandoard/model/card_model.dart';
import 'package:kandoard/model/column_model.dart';
import 'package:kandoard/services/cards_service.dart';
import 'package:kandoard/services/column_service.dart';

class ColumnProvider extends ChangeNotifier {
  final _columnService = ColumnService();
  List<ColumnModel> _columns = [];

  final _cardService = CardService();
  final List<CardModel> _cards = [];

  bool isLoading = false;

  List<ColumnModel> get getColumnsList => _columns;
  List<CardModel> get getcards => _cards;

  Future<void> getColumns(String boardId) async {
    isLoading = true;
    notifyListeners();
    final response = await _columnService.getAllColums(boardId: boardId);
    _columns = response;

    final cards = await _cardService.getAllCards();

    for (int columnIndex = 0; columnIndex < _columns.length; columnIndex++) {
      for (int cardIndex = 0; cardIndex < cards.length; cardIndex++) {
        if (_columns[columnIndex].columnId == cards[cardIndex].columnId) {
          _columns[columnIndex].cards.add(cards[cardIndex]);
        }
      }
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> setNewColumn(
      {required String columnName,
      required String boardId,
      required String columnDescription,
      required String columnCreatedAt,
      required String columnUpdatedAt,
      required int columnWip}) async {
    isLoading = true;
    notifyListeners();

    final response = await _columnService.postColumn(
        columnName: columnName,
        boardId: boardId,
        columnDescription: columnDescription,
        columnCreatedAt: columnCreatedAt,
        columnUpdatedAt: columnUpdatedAt,
        columnWip: columnWip);

    _columns.add(response);
    isLoading = false;
    notifyListeners();
  }

  Future<void> addNewCardToColumn() async {
    // final m = CardModel(
    //     cardId: 1,
    //     cardTitle: 'Aqui Sou eu',
    //     cardDescription: 'cardDescription',
    //     cardPriority: 'low',
    //     cardCover: null,
    //     cardArchived: false,
    //     cardDueDate: null,
    //     columnId: 'clsxh18hj0005wd4whlxevuxd',
    //     cardComments: [],
    //     cardActivity: [],
    //     cardCreatedAt: 'cardCreatedAt',
    //     cardUpdatedAt: 'cardUpdatedAt',
    //     cardMembers: [],
    //     cardLabels: []);
    final response = await _cardService.createCard(
        cardTitle: 'Soy yo',
        cardDescription: 'cardDescription',
        cardPriority: 'low',
        cardCover: null,
        cardArchived: false,
        cardDueDate: null,
        columnId: 'clsxh18hj0005wd4whlxevuxd',
        cardComments: [],
        cardCreatedAt: 'cardCreatedAt',
        cardUpdatedAt: 'cardUpdatedAt',
        cardMembers: [],
        cardLabels: []);

    // final teste = _columns.where((_columns) => _columns.columnId == m.columnId);
    final teste = _columns.where((_columns) => _columns.columnId == response.columnId);
    if (teste.isNotEmpty) {
      print(teste);
      teste.first.cards.add(response);
      notifyListeners();
    } else {
      print('Algo deu errado');
    }
  }
}
