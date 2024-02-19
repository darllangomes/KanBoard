import 'package:flutter/material.dart';
import 'package:kandoard/model/board_model.dart';
import 'package:kandoard/services/board_service.dart';

class BoardProvider extends ChangeNotifier{
  final _boardService = BoardService();
  List<BoardModel> _boards = [];
  List<BoardModel> get getBoards => _boards;

  Future<void> getUserBoards() async {
    final response = await _boardService.boardGetAll();
    notifyListeners();
  }
}