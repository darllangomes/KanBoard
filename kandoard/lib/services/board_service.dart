import 'package:dio/dio.dart';
import 'package:kandoard/model/board_model.dart';

import '../model/user_model.dart';

class BoardService {
  final dio = Dio();

  Future<List<BoardModel>> boardGetAll({required String workspaceId}) async {
    dio.options.headers['Authorization'] =
        "Bearer ${UserLogged.first.getUserId}";

    try {
      final response = await dio.get(
          'https://kanbanboard-nj8m.onrender.com/api/board?workspaceId=$workspaceId');
      List<BoardModel> boards = [];
      response.data.map((item) {
        final board = BoardModel.fromJson(item);
        boards.add(board);
      }).toList();
      print(boards);

      return boards;
    } on DioException catch (e) {
      print(e.message);
    }

    throw 'Algo deu errado';
  }

  Future<BoardModel> postNewBoard(
      {required String boardName,
      required String workspaceId,
      required String description}) async {
    dio.options.headers['Authorization'] =
        "Bearer ${UserLogged.first.getUserId}";

    try {
      final response = await dio
          .post('https://kanbanboard-nj8m.onrender.com/api/board', data: {
        "name": boardName,
        "workspaceId": workspaceId,
        "description": description
      });
      final newBoard = BoardModel.fromJson(response.data);
      print(response.data);
      return newBoard;

    } on DioException catch (e) {
      print(e.response);
    }

    throw 'Não foi possivel adicionar board';
  }
}
