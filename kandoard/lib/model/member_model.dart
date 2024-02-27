
import 'package:kandoard/model/user_model.dart';

class MemberModel{
  String userId;
  String workSpaceId;
  String role;

  String get getUserId => userId;
  String get getUserName => workSpaceId;
  String get getUserEmail => role;

  late User userLogged;
  void setUserLogged(User user) {
    userLogged = user;
  }

  MemberModel({required this.userId, required this.workSpaceId, required this.role});

    factory MemberModel.fromJson(Map<String, dynamic> json){
    return switch (json){
      {
        'workspaceId': String workSpaceId,
        'role': String role,
        'userId': String userId,
      } => MemberModel( workSpaceId: workSpaceId,role: role,userId: userId),
      _ => throw const FormatException('Failed to format Member json.'),
      
    };

  }
}
