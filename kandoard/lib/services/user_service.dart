

import 'package:dio/dio.dart';
import 'package:kandoard/model/user_model.dart';

class UserService{
   final dio = Dio();

   Future <List<User>> userGetAll() async {
       dio.options.headers['Authorization'] =
        "Bearer ${UserLogged.first.getUserId}";

        try{
          final response = await dio.get('https://kanbanboard-nj8m.onrender.com/api/user');
          print(response);
          List<User> users = [];
            response.data.map((item) {
            final w = User.fromJson(item);
            users.add(w);
      }).toList();
      return users;
        }on DioException catch (e) {
      if (e.response!.statusCode != 200) {
        print(e.response);
        return [];
      }
    }
        return [];
   }
}