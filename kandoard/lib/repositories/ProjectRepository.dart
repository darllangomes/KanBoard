import 'package:flutter/material.dart';

import '../model/workspace_model.dart';

class ProjectRepository extends ChangeNotifier {
  //TODO: criar lógica para quando lista estiver vazia
  late List<ProjectModel> _projectList = [ProjectModel('Sirene',1)];
  List<ProjectModel> get getProjectList => _projectList;

  void addProject(ProjectModel project) {
    _projectList.add(project);
    notifyListeners();
  }

}