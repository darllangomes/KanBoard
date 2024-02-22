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
}
