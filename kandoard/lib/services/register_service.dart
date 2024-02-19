import 'dart:convert';
import 'package:dio/dio.dart';
import '../model/user_model.dart';

final dio = Dio();

//TODO: melhorar o formato das requisições para seguir padrões de projetos e SOLID.
Future<String> registerUser(
    {required String userName,
    required String userEmail,
    required String userPassword}) async {

  //TODO: melhorar tratamento de exceções
  try {
     final response = await dio.post(
        'https://kanbanboard-nj8m.onrender.com/api/user/register',
        data: {'password': userPassword, 'email': userEmail, 'name': userName});
        if (response.statusCode == 200 || response.statusCode == 201) {
        User user = User.fromJson(
        jsonDecode(response.toString()) as Map<String, dynamic>);
        return Future.value('Cadastro Realizado com sucesso');}

  } on DioException catch (e) {
    if (e.response!.statusCode == 409) {
      
      return Future.value('Você já possui um cadastro');
    } else {
      //Future<dynamic> message = 'Não foi possivel realizar seu cadastro - Erro: ${e.response!.statusCode}' as Future<dynamic>;
      return Future.value('Não foi possivel realizar seu cadastro - Erro: ${e.response!.statusCode}');
    }
     
  }

  return 'Não foi possivel realizar seu cadastro';
}