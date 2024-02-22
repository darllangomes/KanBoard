import 'package:flutter/material.dart';
import 'package:kandoard/services/cards_service.dart';

import '../model/card_model.dart';

class CardProvider extends ChangeNotifier {
  final _cardService = CardService();
  bool isCardListLoading = false;
  List<CardModel> _cards = [];
  List<CardModel> get getCards => _cards;

  void setCards(newCardList){
    _cards = newCardList;
  }

  Future<void> getCardsList() async {
    isCardListLoading = true;
    notifyListeners();

    final response = await _cardService.getAllCards();
    setCards(response);
    isCardListLoading = false;
    notifyListeners();

  }
}