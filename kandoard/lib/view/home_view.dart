import 'package:flutter/material.dart';
import 'package:kandoard/components/add_workspace_dialog.dart';
import 'package:kandoard/components/workspace_card.dart';
import 'package:kandoard/provider/workspace_provider.dart';
import 'package:kandoard/shared/app_colors.dart';
import 'package:kandoard/shared/app_measures.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static const routeName = '/home';

  @override
  HomeViewState createState() {
    return HomeViewState();
  }

}

class HomeViewState extends State<HomeView>   {

  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<WorkspaceProvider>(context, listen: false).getUserWorkspace();
    });
    

  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: AppBar(
        title: Text(
          'KanBoard',
          style: TextStyle(
              color: AppColors.grey,
              fontSize: 24,
              fontWeight: FontWeight.w200,
              fontStyle: FontStyle.italic),
        ),
        backgroundColor: AppColors.blue,
        automaticallyImplyLeading: false,
        actions: [IconButton(onPressed: (){
          Navigator.popAndPushNamed(context, '/login');
        }, icon: Icon(Icons.logout, color: AppColors.grey,))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
            child: Column(
          children: [
            SizedBox(
                // height: 54,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppMeasures.borderRadius)),
                      backgroundColor: AppColors.blue,
                    ),
                    child:Padding(
                      padding: const EdgeInsets.only(left: 26.0, right: 26.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.add,
                              color: AppColors.grey),
                          Text(
                            'Criar Novo Projeto',
                            style: TextStyle(
                                color: AppColors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w300),
                          ),
                          
                        ],
                      ),
                    ),
                    onPressed: () {
                    

                      addWorkspaceDialog(context);
                      
                    })),
            const SizedBox(
              height: 56,
            ), Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Suas áreas de trabalho:', style: TextStyle(
                              color: AppColors.blue,
                              fontSize: 22,
                              fontWeight: FontWeight.w300),),
              ],
            ), const SizedBox(height: 10,),

            Consumer<WorkspaceProvider>(builder: (context, value, child) {
              final workspace = value.getWorkspace;
              if(value.isLoading){
                return const Center(child: CircularProgressIndicator());
              } else {
                return Expanded(
                child: ListView.builder(
                  itemCount: workspace.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: WorkspaceCard(
                        workspace: workspace[index],
                       
                      ),
                    );
                  },
                ),
              );
              }
              
            })

          ],
        )),
      ),
    );
  }

}
