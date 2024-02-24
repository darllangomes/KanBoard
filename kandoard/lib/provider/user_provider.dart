

import 'package:flutter/material.dart';
import 'package:kandoard/model/user_model.dart';
import 'package:kandoard/services/user_service.dart';

class UserProvider extends ChangeNotifier{
   final _service = UserService();
  List<User> _users = [];
   bool isLoading = false;
  List<User> get getUserList => _users;

    Future<List<User>> getUsers() async {
    isLoading = true;
    notifyListeners();
    
    final response = await _service.userGetAll();

    _users = response;
    isLoading = false;
    notifyListeners();
    return response;
  }
}