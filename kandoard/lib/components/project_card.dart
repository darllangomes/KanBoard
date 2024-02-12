import 'package:flutter/material.dart';
import 'package:kandoard/model/ProjectModel.dart';
import 'package:kandoard/shared/app_colors.dart';

// ignore: must_be_immutable
class ProjectCard extends StatelessWidget {
  String projectName;
  final ProjectModel cardContent;

  ProjectCard({super.key, required this.projectName, required this.cardContent});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
      color: AppColors.grey,
      elevation: 0,
      shape: RoundedRectangleBorder(
          side: BorderSide(
            color: AppColors.blue,
          ),
          borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: AppColors.blue,
        onTap: () {
          Navigator.popAndPushNamed(context, '/kanban', arguments: cardContent);
        },
        child: SizedBox(
            width: 375,
            height: 128,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    projectName,
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w200),
                  ),
                ),
              ],
            )),
      ),
    ));
  }
}
