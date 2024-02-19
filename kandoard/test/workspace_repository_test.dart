import 'package:kandoard/http/workspace_service.dart';
import 'package:test/test.dart';
void main() {
  test('Project list should be incremented', (){
    final projectList = WorkspaceService();

    projectList.workspaceGetAll();

    expect(projectList, 0);
  });
}