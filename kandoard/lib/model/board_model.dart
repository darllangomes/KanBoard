class BoardModel {
  final String boardId;
  final String boardName;
  final String boardDescription;
  final String createdAt;
  final String updatedAt;
  final String workspaceId;

  String get getBoardId => boardId;
  String get getBoardName => boardName;
  String get getBoardDescription => boardDescription;
  String get getCreatedAt => createdAt;
  String get getUpdatedAt => updatedAt;
  String get getWorkspaceId => workspaceId;

  BoardModel(
      {required this.boardId,
      required this.boardName,
      required this.boardDescription,
      required this.createdAt,
      required this.updatedAt,
      required this.workspaceId});

  factory BoardModel.fromJson(json){
    return switch (json) {
      {'id': String boardId,
      'name': String boardName,
      'description': String boardDescription,
      'createdAt': String createdAt,
      'updatedAt': String updatedAt,
      'workspaceId': String workspaceId
      } => BoardModel(boardId: boardId, boardName: boardName, boardDescription: boardDescription, createdAt: createdAt, updatedAt: updatedAt, workspaceId: workspaceId),
      _ => throw const FormatException('Não foi possivel criar um board'),
    };
  }
}
