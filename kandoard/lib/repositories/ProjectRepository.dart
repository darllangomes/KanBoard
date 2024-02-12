import 'package:flutter/material.dart';

import '../model/ProjectModel.dart';

class ProjectRepository extends ChangeNotifier {
  //TODO: criar lógica para quando lista estiver vazia
  late List<ProjectModel> _projectList = [ProjectModel('Sirene')];
  List<ProjectModel> get getProjectList => _projectList;

  void addProject(ProjectModel project) {
    _projectList.add(project);
    notifyListeners();
  }

}