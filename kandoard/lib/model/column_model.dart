class ColumnModel {
  String columnId;
  String columnName;
  String boardId;
  String columnDescription;
  String columnCreatedAt;
  String columnUpdatedAt;
  int columnWip;

  String get getColumnId => columnId;
  String get getColumnName => columnName;
  String get getBoardId => boardId;
  String get getColumnDescription => columnDescription;
  String get getColumnCreatedAt => columnCreatedAt;
  String get getColumnUpdatedAt => columnUpdatedAt;
  int get getColumnWip => columnWip;

  ColumnModel(
      {required this.columnId,
      required this.columnName,
      required this.boardId,
      required this.columnDescription,
      required this.columnCreatedAt,
      required this.columnUpdatedAt,
      required this.columnWip});

  factory ColumnModel.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        "id": String columnId,
        "name": String columnName,
        "description": String columnDescription,
        "boardId": String boardId,
        "wip": int columnWip,
        "createdAt": String columnCreatedAt,
        "updatedAt": String columnUpdatedAt,
      } =>
        ColumnModel(
            columnId: columnId,
            columnName: columnName,
            columnDescription: columnDescription,
            boardId: boardId,
            columnWip: columnWip,
            columnCreatedAt: columnCreatedAt,
            columnUpdatedAt: columnUpdatedAt),
      _ => throw 'Não foi possivel adicionar coluna'
    };
  }
}
