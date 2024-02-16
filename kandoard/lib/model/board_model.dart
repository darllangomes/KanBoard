class BoardModel {
  final String _boardName;
  final int _projectId;
  final int _id;

  String get getBoardName => _boardName;
  int get getBoardId => _id;
  int get getProjectId=> _projectId;

  BoardModel(this._boardName, this._projectId, this._id);
}
