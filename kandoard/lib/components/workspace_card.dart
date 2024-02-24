import 'package:flutter/material.dart';
import 'package:kandoard/model/workspace_model.dart';
import 'package:kandoard/shared/app_colors.dart';
import 'package:kandoard/shared/app_measures.dart';


// ignore: must_be_immutable
class WorkspaceCard extends StatelessWidget {

  WorkspaceModel workspace;
  WorkspaceCard({super.key, required this.workspace});

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
          borderRadius: BorderRadius.circular(AppMeasures.borderRadius)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: AppColors.blue,
        onTap: () {
          Navigator.pushNamed(context, '/workspace', arguments: workspace);
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
                    workspace.getWorkspaceName,
                    style: TextStyle(
                        color: AppColors.blue,
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
