import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import '../model/user_model.dart';
import '../model/workspace_model.dart';


class WorkspaceService {
  final dio = Dio();

  Future<List<WorkspaceModel>> workspaceGetAll() async {
    dio.options.headers['Authorization'] =
        "Bearer ${UserLogged.last.getUserId}";
    final userId = JwtDecoder.decode(UserLogged.last.getUserId);

    try {
      final response =
          await dio.get('https://kanbanboard-nj8m.onrender.com/api/workspace?userId=${userId['id']}');

      List<WorkspaceModel> workspace = [];

      response.data.map((item) {
       final w = WorkspaceModel.fromJson(item);
       workspace.add(w);
      }).toList();
      print(workspace);

      return workspace;

    } on DioException catch (e) {
      if (e.response!.statusCode != 200) {
        print(e.response);
        return [];
      }
    }

    return [];
  }

  Future<WorkspaceModel> postWorkspace(String workspaceName) async {
    dio.options.headers['Authorization'] =
        "Bearer ${UserLogged.last.getUserId}";

    try {
      final response = await dio.post('https://kanbanboard-nj8m.onrender.com/api/workspace', data: {'name': workspaceName});
      final newWorkspace = WorkspaceModel.fromJson(response.data);
      print(response.data);
      return newWorkspace;
    } on DioException catch (e) {
      print(e.response);
    }
    
    throw '';

  }
}
