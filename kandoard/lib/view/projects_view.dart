import 'package:flutter/material.dart';
import 'package:kandoard/components/project_card.dart';
import 'package:kandoard/model/ProjectModel.dart';
import 'package:kandoard/repositories/ProjectRepository.dart';
import 'package:kandoard/shared/app_colors.dart';
import 'package:provider/provider.dart';

class ProjectsView extends StatelessWidget {
  const ProjectsView({super.key});
  static const routeName = '/projetos';

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
                      padding: EdgeInsets.only(left: 36.0, right: 36.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Criar Novo Projeto',
                            style: TextStyle(
                                color: Color.fromARGB(255, 52, 52, 52), fontSize: 20, fontWeight: FontWeight.w300),
                                
                          ),
                          Icon(Icons.add,
                              color: Color.fromARGB(255, 52, 52, 52)),
                        ],
                      ),
                    ),
                    onPressed: () {
                      final projectsList = context.read<ProjectRepository>();

                      projectsList.addProject(ProjectModel('Projeto Manhatan'));
                    })),
            const SizedBox(
              height: 56,
            ),
            Consumer<ProjectRepository>(builder: (context, value, child) {
              return Expanded(
                child: ListView.builder(
                  itemCount: value.getProjectList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: ProjectCard(
                        projectName: value.getProjectList[index].nameProject,
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
