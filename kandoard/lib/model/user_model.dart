import 'package:flutter/material.dart';

class User {
  String userId;
  String userName;
  String userEmail;

  String get getUserId => userId;
  String get getUserName => userName;
  String get getUserEmail => userEmail;

  late User userLogged;
  void setUserLogged(User user) {
    userLogged = user;
  }

  User({required this.userId, required this.userName, required this.userEmail});

  factory User.fromJson(Map<String, dynamic> json){
    return switch (json){
      {'id': String userId,
        'email': String userEmail,
        'name': String userName
      } => User(userId: userId, userEmail: userEmail, userName: userName),
      _ => throw const FormatException('Failed to load album.'),
      
    };

  }

}

// TODO: Utilizar o shared_preferences
List<User> UserLogged = [];