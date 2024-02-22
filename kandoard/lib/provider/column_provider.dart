import 'package:flutter/material.dart';
import 'package:kandoard/model/column_model.dart';
import 'package:kandoard/services/column_service.dart';

class ColumnProvider extends ChangeNotifier {
  final _columnService = ColumnService();
  List<ColumnModel> _columns = [];
  bool isLoading = false;

  List<ColumnModel> get getColumnsList => _columns;

  Future<void> getColumns(String boardId) async {
    isLoading = true;
    notifyListeners();
    final response = await _columnService.getAllColums(boardId: boardId);
    _columns = response;
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

 
}
