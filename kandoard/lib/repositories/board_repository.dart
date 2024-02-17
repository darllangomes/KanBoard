import 'package:flutter/material.dart';

import '../model/board_model.dart';

class BoardRepository extends ChangeNotifier {
  //TODO: criar lógica para quando lista estiver vazia
  late List<BoardModel> _boardList = [BoardModel('Loja', 1, 1)];
  List<BoardModel> getBoardList(int projectId) =>
      _boardList.where((element) => element.getProjectId == projectId).toList();

  void addBoard(BoardModel board) {
    _boardList.add(board);
    notifyListeners();
  }
}
