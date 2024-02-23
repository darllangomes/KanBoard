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
   
    final response = await _cardService.createCard(
        cardTitle: 'Soy yo', //campo Obrigatorio
        cardDescription: 'cardDescription', 
        cardPriority: 'low', //campo Obrigatorio
        cardCover: null,
        cardArchived: false,
        cardDueDate: null,
        columnId: 'clsxh18hj0005wd4whlxevuxd', //campo Obrigatorio
        cardComments: [],
        cardCreatedAt: 'cardCreatedAt', 
        cardUpdatedAt: 'cardUpdatedAt',
        cardMembers: [], //campo Obrigatorio
        cardLabels: []);

    final teste = _columns.where((columns) => columns.columnId == response.columnId);
    if (teste.isNotEmpty) {
      print(teste);
      teste.first.cards.add(response);
      notifyListeners();
    } else {
      print('Algo deu errado');
    }
  }

  Future<void> changeCardtoNextColumn({required CardModel card, required int indexCard}) async {
    final indexColunaAtual = _columns.indexOf(_columns.where((columns) => columns.getColumnId == card.getcolumnId).first);
    final indexColumnToMoveCard = indexColunaAtual+1;
    final columnToMoveCardId = _columns[indexColumnToMoveCard].getColumnId;

    final response = await _cardService.putSwitchColumn(cardId: card.getCardId, columnId: columnToMoveCardId, cardActivity: {"action": "move"});
    
    // final cardToRemove = _columns[indexColunaAtual].cards[indexCard];
    _columns[indexColunaAtual].cards.remove(card);
    notifyListeners();

    _columns[indexColumnToMoveCard].cards.add(response);
    notifyListeners();

    
  }
}
