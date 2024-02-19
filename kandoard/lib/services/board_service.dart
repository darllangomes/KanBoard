import 'package:dio/dio.dart';
import 'package:kandoard/model/board_model.dart';

import '../model/user_model.dart';

class BoardService {
  final dio = Dio();

  Future<List<BoardModel>> boardGetAll() async {
    dio.options.headers['Authorization'] =
        "Bearer ${UserLogged.first.getUserId}";

    try {

       final response = await dio.get('https://kanbanboard-nj8m.onrender.com/api/board');
       List<BoardModel> boards = [];
       response.data.map((item) {
        final board = BoardModel.fromJson(item);
        boards.add(board);
       }).toList();
       print(boards);

       return boards;

    } on DioException catch (e){
      print(e.message);
    }
   
    throw 'Algo deu errado';

  }


}