import 'package:flutter/material.dart';
import 'package:kandoard/http/workspace_service.dart';
import 'package:kandoard/model/workspace_model.dart';

class WorkspaceProvider extends ChangeNotifier {

  final _service = WorkspaceService();
  List<WorkspaceModel> _workspace = [];
  bool isLoading = false;
  List<WorkspaceModel> get getWorkspace => _workspace;

  Future<void> getUserWorkspace() async {
    isLoading = true;
    notifyListeners();
    
    final response = await _service.workspaceGetAll();

    _workspace = response;
    isLoading = false;
    notifyListeners();
  }

  void addBoardToWorkspace(String workspaceName) async {
    final newWorkspace = await _service.postWorkspace(workspaceName);
    _workspace.add(newWorkspace);
    notifyListeners();
  }

}