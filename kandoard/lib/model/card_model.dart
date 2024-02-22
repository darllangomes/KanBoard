import 'dart:convert';

class CardModel {
  int cardId;
  String cardTitle;
  String cardDescription;
  String cardPriority;
  String? cardCover;
  bool cardArchived;
  String? cardDueDate;
  String columnId;
  List cardComments;
  List cardActivity =
      []; //Acho que vai ter que criar outro tipo de model para atividade {"date": "2024-02-22T18:51:33.164Z","action": "created", "userId": "clsvu696c0000vg8jxauwc0qr"}
  String cardCreatedAt;
  String cardUpdatedAt;
  List cardMembers =
      []; // {"userId": "clsxklj7l00006btky261yytp","workspaceId": "clsw2p2qr0000bm04u4z5k82f"}
  List cardLabels = [];

  int get getCardId => cardId;
  String get getcardTitle => cardTitle;
  String get getcardDescription => cardDescription;
  String get getcardPriority => cardPriority;
  String? get getcardCover => cardCover;
  bool get getcardArchived => cardArchived;
  String? get getcardDueDate => cardDueDate;
  String get getcolumnId => columnId;
  List get getcardComments => cardComments;
  List get getcardActivity => cardActivity;
  String get getcardCreatedAt => getcardCreatedAt;
  String get getcardUpdatedAt => getcardUpdatedAt;
  List get getcardMembers => cardMembers;
  List get getcardLabels => cardLabels;

  CardModel(
      {required this.cardId,
      required this.cardTitle,
      required this.cardDescription,
      required this.cardPriority,
      required this.cardCover,
      required this.cardArchived,
      required this.cardDueDate,
      required this.columnId,
      required this.cardComments,
      required this.cardActivity,
      required this.cardCreatedAt,
      required this.cardUpdatedAt,
      required this.cardMembers,
      required this.cardLabels});

  factory CardModel.fromMap(Map<String, dynamic> map) {
    return CardModel(
        cardId: map['id'],
        cardTitle: map['title'],
        cardDescription: map['description'],
        cardPriority: map['priority'],
        cardCover: map['cover'],
        cardArchived: map['archived'],
        cardDueDate: map['dueDate'],
        columnId: map['columnId'],
        cardComments: List.from((map['comments']) as List), //TODO: tentar transformar List em List<Comments>
        cardActivity: List.from((map['activity'] as List)), //TODO: tentar transformar List em List<Activity>
        cardCreatedAt: map['createdAt'],
        cardUpdatedAt: map['updatedAt'],
        cardMembers: List.from(map['members'] as List), //TODO: tentar transformar List em List<Members>
        cardLabels: List.from(map['labels'] as List) ); //TODO: tentar transformar List em List<Labels>
  }

  // factory CardModel.fromJson(Map<String, dynamic> json) {
  //   return switch (json) {
  //     {
  //       "id": int cardId,
  //       "title": String cardTitle,
  //       "description": String cardDescription,
  //       "priority": String cardPriority,
  //       "cover": String cardCover,
  //       "archived": bool cardArchived,
  //       "dueDate": String cardDueDate,
  //       "columnId": String columnId,
  //       "comments": List cardComments,
  //       "activity": List cardActivity,
  //       "createdAt": String cardCreatedAt,
  //       "updatedAt": String cardUpdatedAt,
  //       "members": List cardMembers,
  //       "labels": List cardLabels
  //     } =>
  //       CardModel(
  //           cardId: cardId,
  //           cardTitle: cardTitle,
  //           cardDescription: cardDescription,
  //           cardPriority: cardPriority,
  //           cardCover: cardCover,
  //           cardArchived: cardArchived,
  //           cardDueDate: cardDueDate,
  //           columnId: columnId,
  //           cardComments: cardComments,
  //           cardActivity: cardActivity,
  //           cardCreatedAt: cardCreatedAt,
  //           cardUpdatedAt: cardUpdatedAt,
  //           cardMembers: cardMembers,
  //           cardLabels: cardLabels),
  //     _ => throw 'Não foi possivel adicionar card'
  //   };
  // }
}
