import 'package:flutter/material.dart';
import 'package:kandoard/components/add_board_dialog.dart';
import 'package:kandoard/components/add_member_dialog.dart';
import 'package:kandoard/model/member_model.dart';
import 'package:kandoard/model/user_model.dart';
import 'package:kandoard/model/workspace_model.dart';
import 'package:kandoard/provider/board_provider.dart';
import 'package:kandoard/provider/member_provider.dart';
import 'package:kandoard/provider/user_provider.dart';
import 'package:kandoard/services/member_service.dart';
import 'package:kandoard/shared/app_colors.dart';
import 'package:kandoard/shared/app_measures.dart';
import 'package:provider/provider.dart';
import '../components/board_card.dart';

class WorkspaceView extends StatefulWidget {
  const WorkspaceView({super.key});
  static const routeName = '/workspace';

  @override
  WorkspaceViewState createState() {
    return WorkspaceViewState();
  }
}

class WorkspaceViewState extends State<WorkspaceView> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final workspace =
          ModalRoute.of(context)!.settings.arguments as WorkspaceModel;
      Provider.of<BoardProvider>(context, listen: false)
          .getUserBoards(workspace.getWorkspaceId);
      Provider.of<UserProvider>(context,listen: false);
      Provider.of<MemberProvider>(context, listen:false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final workspace =
        ModalRoute.of(context)!.settings.arguments as WorkspaceModel;
     
         List<User> teste=[];
         final response = Provider.of<UserProvider>(context,listen: false)
           .getUsers().then((value) => {
              /* print('usuarios encontrados'), */
              teste = Provider.of<UserProvider>(context,listen: false).getUserList
            }
         );
         List<MemberModel> memberList = [];
         final memberProvider = Provider.of<MemberProvider>(context,listen: false);
         Provider.of<MemberProvider>(context, listen: false).getAllMembers()
         .then((value) => {
          memberList = Provider.of<MemberProvider>(context, listen:false).getMemberList,
           print('membros encontrados')
         });
        
         print (memberList);
        
   
    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.white),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        actionsIconTheme: const IconThemeData(),
        title: Text(
          workspace.getWorkspaceName,
          style: TextStyle(
              color: AppColors.white,
              fontSize: 24,
              fontWeight: FontWeight.w200,
              fontStyle: FontStyle.italic),
        ),
        backgroundColor: AppColors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppMeasures.borderRadius)),
                        backgroundColor: AppColors.blue),
                    child: Row(
                      children: [
                        Icon(
                          Icons.person_add_alt_1,
                          color: AppColors.grey,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Adicionar participantes',
                          style: TextStyle(
                              fontSize: 16,
                              color: AppColors.grey,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    onPressed: () {
                     // print('Adicionar Participante');
                      addMemberDialog(context, teste, memberList,memberProvider, workspace.getWorkspaceId);
                    }),
                IconButton(
                    onPressed: () {
                      addBoardDialog(context, workspace.getWorkspaceId);
                    },
                    icon: Icon(
                      Icons.add_box_outlined,
                      color: AppColors.blue,
                      size: 40,
                    )),
              ],
            ),
            const SizedBox(
              height: 42,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Seus quadros Kanban:', style: TextStyle(
                              color: AppColors.blue,
                              fontSize: 22,
                              fontWeight: FontWeight.w300),),
              ],
            ), const SizedBox(height: 10,),
            Consumer<BoardProvider>(builder: (context, value, child) {
              final boards = value.getBoards;
              if (value.isLoading){
                return const Center(child: CircularProgressIndicator(),);
              } else {
                return Expanded(
                child: ListView.builder(
                    itemCount: boards.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: BoardCard(boardContent: boards[index]),
                      );
                    }),
              );
              }
              
            })
          ],
        )),
      ),
    );
  }
}
