import 'package:flutter/material.dart';
import 'package:kandoard/model/board_model.dart';
import 'package:kandoard/services/board_service.dart';

class BoardProvider extends ChangeNotifier{
  final _boardService = BoardService();
  List<BoardModel> _boards = [];
  bool isLoading = false;
  List<BoardModel> get getBoards => _boards;

  Future<void> getUserBoards(String workspaceId) async {

    isLoading = true;
    notifyListeners();

    final response = await _boardService.boardGetAll(workspaceId: workspaceId);
    isLoading = false;
    _boards = response;
    notifyListeners();
  }

  Future<void> setNewBoard({required String boardName, required String boardDescription, required String workspaceId}) async {
    isLoading = true;
    notifyListeners();

    final newBoard = await _boardService.postNewBoard(boardName: boardName, workspaceId: workspaceId, description: boardDescription);
    _boards.add(newBoard);
    isLoading = false;
    notifyListeners();
  }
}