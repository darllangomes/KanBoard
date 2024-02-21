class ColumnModel {
  String columnId;
  String columnName;
  String boardId;
  String columnDescription;
  String columnCreatedAt;
  String columnUpdatedAt;
  String columnWip;

  String get getColumnId => columnId;
  String get getColumnName => columnName;
  String get getBoardId => boardId;
  String get getColumnDescription => columnDescription;
  String get getColumnCreatedAt => columnCreatedAt;
  String get getColumnUpdatedAt => columnUpdatedAt;
  String get getColumnWip => columnWip;

  ColumnModel(
      {required this.columnId,
      required this.columnName,
      required this.boardId,
      required this.columnDescription,
      required this.columnCreatedAt,
      required this.columnUpdatedAt,
      required this.columnWip});

  factory ColumnModel.fromJson(Map<String, dynamic>json){
    return switch (json) {
      {"id": String columnId,
    "name": String columnName,
    "boardId": String boardId,
    "description": String columnDescription,
    "createdAt": String columnCreatedAt,
    "updatedAt": String columnUpdatedAt,
    "wip": String columnWip} => ColumnModel(columnId: columnId, columnName: columnName, boardId: boardId, columnDescription: columnDescription, columnCreatedAt: columnCreatedAt, columnUpdatedAt: columnUpdatedAt, columnWip: columnWip),
    _ => throw 'Não foi possivel adicionar coluna'
    } ;
  }
}
