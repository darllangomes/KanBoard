
class WorkspaceModel {
  final String workspaceName;
  final String workspaceId;
  final String userId;
  String get getWorkspaceName => workspaceName;
  String get getWorkspaceId => workspaceId;
  String get getUserId => userId;

  WorkspaceModel({required this.workspaceName, required this.workspaceId, required this.userId});

  factory WorkspaceModel.fromJson(Map<String, dynamic> json){
    return switch (json) {
      {'id': String workspaceId,
      'name': String workspaceName,
      'userId': String userId}
      => WorkspaceModel(workspaceName: workspaceName, workspaceId: workspaceId, userId: userId),
      _ => throw const FormatException('Erro ao carregar projetos.')
    }; 
  }
}
