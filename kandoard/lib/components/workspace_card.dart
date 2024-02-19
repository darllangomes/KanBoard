import 'package:flutter/material.dart';
import 'package:kandoard/model/board_model.dart';
import 'package:kandoard/shared/app_colors.dart';


// ignore: must_be_immutable
class WorkspaceCard extends StatelessWidget {
  String projectName;
  // final BoardModel cardContent;

  WorkspaceCard({super.key, required this.projectName});

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
          Navigator.pushNamed(context, '/workspace', );
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
