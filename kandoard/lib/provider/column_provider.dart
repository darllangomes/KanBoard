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
      required int columnWip}) async {
    isLoading = true;
    notifyListeners();

    final response = await _columnService.postColumn(
        columnName: columnName,
        boardId: boardId,
        columnDescription: columnDescription,
        columnWip: columnWip);

    _columns.add(response);
    isLoading = false;
    notifyListeners();
  }

  Future<void> addNewCardToColumn({required String columnId, String description = '', required String cardDueDate, required String cardPriority, required String cardTitle, cardMembers = const []}) async {
   
    final response = await _cardService.createCard(
        cardTitle: cardTitle, //campo Obrigatorio
        cardDescription: description, 
        cardPriority: cardPriority, //campo Obrigatorio
        cardCover: null,
        cardArchived: false,
        cardDueDate: cardDueDate, //campo obrigatorio //mudar para pegar a data
        columnId: columnId, //campo Obrigatorio
        cardComments: [],
        cardCreatedAt: 'cardCreatedAt', 
        cardUpdatedAt: 'cardUpdatedAt',
        cardMembers: cardMembers, //campo Obrigatorio
        cardLabels: []);

    final selectedColumn = _columns.where((columns) => columns.columnId == response.columnId);
    if (selectedColumn.isNotEmpty) {
      selectedColumn.first.cards.add(response);
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
    
    
    _columns[indexColunaAtual].cards.remove(card);
    notifyListeners();

    _columns[indexColumnToMoveCard].cards.add(response);
    notifyListeners();

    
  }

  Future<void> deleteCardFromColumn({required CardModel card}) async {
    final indexColuna = _columns.indexOf(_columns.where((columns) => columns.getColumnId == card.getcolumnId).first);
    final response = await _cardService.deleteCard(cardId: card.getCardId);

    _columns[indexColuna].cards.remove(card);
    notifyListeners();
  }
}
