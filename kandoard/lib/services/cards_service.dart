import 'package:dio/dio.dart';
import 'package:kandoard/model/card_model.dart';

import '../model/user_model.dart';

class CardService {
  Dio dio = Dio();

  Future<List<CardModel>> getAllCards() async {
    dio.options.headers['Authorization'] =
        "Bearer ${UserLogged.first.getUserId}";
    try {
      final response =
          await dio.get('https://kanbanboard-nj8m.onrender.com/api/card');
      print(response.data);
      List<CardModel> cards = [];
      response.data.map((item) {
        final card = CardModel.fromMap(item);
        print(card);
        cards.add(card);
      }).toList();
      print(cards);
      return cards;
    } on DioException catch (e) {
      print(e.response);
    }
    throw 'Não foi possivel adicionar card';
  }

  Future<CardModel> createCard(
      {required String cardTitle,
      required String cardDescription,
      required String cardPriority,
      String? cardCover,
      required bool cardArchived,
      String? cardDueDate,
      required String columnId,
      List cardComments = const [],
      Map<String, String> cardActivity = const {"action": "created"},
      required String cardCreatedAt,
      required String cardUpdatedAt,
      List cardMembers = const [],
      List cardLabels = const []}) async {
    dio.options.headers['Authorization'] =
        "Bearer ${UserLogged.first.getUserId}";
    try {
      final response =
          await dio.post('https://kanbanboard-nj8m.onrender.com/api/card', data: {
            'columnId': columnId,   
            'description': cardDescription, 
            'comments': cardComments,
            'priority': cardPriority,
            'title': cardTitle,
            'activity': cardActivity,

          });
      print(response.data);
      final newCard = CardModel.fromMap(response.data);
      print('Novo card ${newCard}');

      return newCard;

    } on DioException catch (e) {
      print(e.response);
    }
    throw 'Não foi possivel adicionar card';
  }
}
