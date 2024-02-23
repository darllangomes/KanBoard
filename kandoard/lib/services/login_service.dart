import 'package:dio/dio.dart';
import 'package:kandoard/model/user_model.dart';

Future<String> loginUser({required userEmail, required userPassword}) async {
  final dio = Dio();

  try {
    final response = await dio.post('https://kanbanboard-nj8m.onrender.com/api/user/login',
        data: {'password': userPassword, 'email': userEmail});
    //TODO: implementar shared_preferences e criar logica para manter sessão do usuario ativa
    //Map<String, dynamic> decodedToken = JwtDecoder.decode(response.toString());
  
    //TODO: implementar logica que faça a requisção GetOne da API, para pegar a informação userName do usuario
    User user = User(userEmail: userEmail, userId: response.toString(), userName: '');
    UserLogged.add(user);
    if(response.statusCode == 200 || response.statusCode == 201) {
      return 'Login';
    }
  } on DioException catch (e) {
    switch (e.response!.statusCode){
      case 401:
        return 'Senha Incorreta';
      case 404:
        return 'Seu Email está Incorreto ou você não possui uma conta.';
      case 422:
        return 'Email inválido';

    } 
  }

  return 'Ocorreu um erro ao realizar o login. Tente novamente';
}
