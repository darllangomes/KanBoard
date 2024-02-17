import 'package:kandoard/model/workspace_model.dart';
import 'package:kandoard/repositories/ProjectRepository.dart';
import 'package:test/test.dart';
void main() {
  test('Project list should be incremented', (){
    final projectList = ProjectRepository();

    projectList.addProject(WorkspaceModel('Novo Projeto', 1));

    expect(projectList.getProjectList.length, 2);
  });
}