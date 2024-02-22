import 'package:dio/dio.dart';
import 'package:kandoard/model/column_model.dart';

import '../model/user_model.dart';

class ColumnService {
  Dio dio = Dio();

  Future<List<ColumnModel>> getAllColums({required String boardId}) async {
    dio.options.headers['Authorization'] =
        "Bearer ${UserLogged.first.getUserId}";
    try {
      final response = await dio.get(
          'https://kanbanboard-nj8m.onrender.com/api/column?boardId=$boardId');

      List<ColumnModel> columns = [];
      response.data.map((item) {
        final column = ColumnModel.fromJson(item);
        columns.add(column);
      }).toList();

      print(columns);
      return columns;
    } on DioException catch (e) {
      print(e.response);
    }
    throw 'ocorreu um erro.';
  }

  Future<ColumnModel> postColumn({required String columnName,
      required String boardId,
      required String columnDescription,
      required String columnCreatedAt,
      required String columnUpdatedAt,
      required int columnWip}) async {
    try {
      dio.options.headers['Authorization'] =
          "Bearer ${UserLogged.first.getUserId}";
      final response = await
          dio.post('https://kanbanboard-nj8m.onrender.com/api/column', data: {
        "name": columnName,
        "boardId": boardId,
        "description": columnDescription,
        "createdAt": columnCreatedAt,
        "updatedAt": columnUpdatedAt,
        "wip": columnWip
      });
      
      final newColumn = ColumnModel.fromJson(response.data);
      print(response);
      
      return newColumn;
    } on DioException catch (e) {
      print(e.response);
    }

    throw 'Ocorreu um erro ao criar coluna';
  }
}
