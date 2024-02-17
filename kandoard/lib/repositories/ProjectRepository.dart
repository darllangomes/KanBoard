import 'package:flutter/material.dart';

import '../model/workspace_model.dart';

class ProjectRepository extends ChangeNotifier {
  //TODO: criar lógica para quando lista estiver vazia
  late List<WorkspaceModel> _projectList = [WorkspaceModel('Sirene',1)];
  List<WorkspaceModel> get getProjectList => _projectList;

  void addProject(WorkspaceModel project) {
    _projectList.add(project);
    notifyListeners();
  }

}