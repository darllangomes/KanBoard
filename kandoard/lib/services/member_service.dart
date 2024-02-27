import 'package:dio/dio.dart';
import 'package:kandoard/model/member_model.dart';
import 'package:kandoard/model/user_model.dart';

class MemberService{
  final dio = Dio();


   Future<List<MemberModel>> getAllMembers() async {
    dio.options.headers['Authorization'] =
        "Bearer ${UserLogged.first.getUserId}";
    try {
      final response =
          await dio.get('https://kanbanboard-nj8m.onrender.com/api/member');

      List<MemberModel> members = [];
       response.data.map((item) {
        final element = MemberModel.fromJson(item);

        members.add(element);
      }).toList(); 
     print(members);

      return members;
    } on DioException catch (e) {
      print(e.response);
    }
    throw 'Não foi possivel encontrar membros';
  }

     Future<List<MemberModel>> getMembers(String workspaceId) async {
    dio.options.headers['Authorization'] =
        "Bearer ${UserLogged.first.getUserId}";
    try {
      final response =
          await dio.get('https://kanbanboard-nj8m.onrender.com/api/member/:workspaceId=$workspaceId');

      List<MemberModel> members = [];
      response.data.map((item) {
        final element = MemberModel.fromJson(item);

        members.add(element);
      }).toList();

      return members;
    } on DioException catch (e) {
      print(e.response);
    }
    throw 'Não foi possivel encontrar membros';
  }



  Future<MemberModel> postMember(
    {required String userId,
    required String workSpaceId,
    required String role}) async { 
      print('dados do post: workspaceId:$workSpaceId role: $role  userId:$userId ');   
  try {
     final response = await dio.post(
        'https://kanbanboard-nj8m.onrender.com/api/member',
        data: {'role': role,'workspaceId': workSpaceId,'userId': userId });
        
        
        MemberModel member = MemberModel.fromJson(response.data);
        print('resposta do create member');
        print(response);
        return member;
        

  } on DioException catch (e) {
    print(e.response);
  }throw 'Ocorreu um erro ao adcionar membro';

 
    }
}