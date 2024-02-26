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

      List<CardModel> cards = [];
      response.data.map((item) {
        final card = CardModel.fromMap(item);

        cards.add(card);
      }).toList();

      return cards;
    } on DioException catch (e) {
      print(e.response);
    }
    throw 'Não foi possivel adicionar card';
  }

  Future<CardModel> createCard(
      {required String cardTitle,
      String cardDescription = "",
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
      final response = await dio
          .post('https://kanbanboard-nj8m.onrender.com/api/card', data: {
        'columnId': columnId,
        'description': cardDescription,
        'dueDate': cardDueDate,
        'comments': cardComments,
        'priority': cardPriority,
        'title': cardTitle,
        'activity': cardActivity,
      });

      final newCard = CardModel.fromMap(response.data);

      return newCard;
    } on DioException catch (e) {
      print(e.response);
    }
    throw 'Não foi possivel adicionar card';
  }

  Future<CardModel> putSwitchColumn({
    required int cardId,
    required String columnId,
    required Map<String, String> cardActivity,
  }) async {

    try {
      final response =
        await dio.put('https://kanbanboard-nj8m.onrender.com/api/card', data: {
      'id': cardId,
      'columnId': columnId,
      'activity': cardActivity,
    });
    
    print(response.data);
    final card = CardModel.fromMap(response.data);
    return card;

    } on DioException catch (e) {
      print(e.response);
    }
    throw 'Não foi possivel mudar card de coluna';
  } 

}
