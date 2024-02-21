import 'package:flutter/material.dart';
import 'package:kandoard/components/add_workspace_dialog.dart';
import 'package:kandoard/components/workspace_card.dart';
import 'package:kandoard/provider/workspace_provider.dart';
import 'package:kandoard/shared/app_colors.dart';
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
        title: const Text(
          'KanBoard',
          style: TextStyle(
              color: Color(0xFFD9D9D9),
              fontSize: 24,
              fontWeight: FontWeight.w200,
              fontStyle: FontStyle.italic),
        ),
        backgroundColor: AppColors.blue,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
            child: Column(
          children: [
            SizedBox(
                height: 54,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      backgroundColor: AppColors.blue,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 26.0, right: 26.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Criar Novo Projeto',
                            style: TextStyle(
                                color: Color.fromARGB(255, 52, 52, 52),
                                fontSize: 24,
                                fontWeight: FontWeight.w300),
                          ),
                          Icon(Icons.add,
                              color: Color.fromARGB(255, 52, 52, 52)),
                        ],
                      ),
                    ),
                    onPressed: () {
                    

                      addWorkspaceDialog(context);
                      
                    })),
            const SizedBox(
              height: 56,
            ), 

            Consumer<WorkspaceProvider>(builder: (context, value, child) {
              final workspace = value.getWorkspace;
              return Expanded(
                child: ListView.builder(
                  itemCount: workspace.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: WorkspaceCard(
                        workspace: workspace[index],
                       
                      ),
                    );
                  },
                ),
              );
            })

          ],
        )),
      ),
    );
  }

}
