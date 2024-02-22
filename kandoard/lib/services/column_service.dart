import 'package:dio/dio.dart';
import 'package:kandoard/model/column_model.dart';

import '../model/user_model.dart';

class ColumnService {
  Dio dio = Dio();

  Future<List<ColumnModel>> getAllColums() async {
    dio.options.headers['Authorization'] =
        "Bearer ${UserLogged.first.getUserId}";
    try {
      final response = await 
          dio.get('https://kanbanboard-nj8m.onrender.com/api/column');

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
}
