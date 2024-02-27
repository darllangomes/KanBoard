

import 'package:flutter/material.dart';
import 'package:kandoard/model/member_model.dart';
import 'package:kandoard/services/member_service.dart';

class MemberProvider extends ChangeNotifier{
     final _memberService = MemberService();
  List<MemberModel> _members = [];
   bool isLoading = false;
  List<MemberModel> get getMemberList => _members;

    Future<List<MemberModel>> getAllMembers() async {
    isLoading = true;
    notifyListeners();
    final response = await _memberService.getAllMembers();
    isLoading = false;
    notifyListeners();
    return response;
    }

        Future<void> getMembers(String workspaceId) async {
    isLoading = true;
    notifyListeners();
    final response = await _memberService.getMembers(workspaceId);
    print('response: $response');
    isLoading = false;
    notifyListeners();
    }

   Future<void> addMembers(String workSpaceId,String role, String userId) async{
    notifyListeners();
    isLoading = true;
    final response = await _memberService.postMember(workSpaceId: workSpaceId, userId: userId,  role: role);
  
    _members.add(response);
    isLoading = false;
    notifyListeners();
    }


}