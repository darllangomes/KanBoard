import 'package:flutter/material.dart';
import 'package:kandoard/shared/app_colors.dart';

class ChartView extends StatefulWidget {
  const ChartView({super.key});
  static const routeName = '/charts';
  @override
  ChartViewState createState() {
    // TODO: implement createState
    return ChartViewState();
  }
}

class ChartViewState extends State<ChartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: AppBar(
        backgroundColor: AppColors.blue,
        iconTheme: IconThemeData(color: AppColors.white),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        actionsIconTheme: const IconThemeData(),
        title: Text(
          'Métricas Kanban',
          style: TextStyle(
              color: AppColors.white,
              fontSize: 24,
              fontWeight: FontWeight.w200,
              fontStyle: FontStyle.italic),
        ),
      ),
      body: SingleChildScrollView(child: Column(children: [],)),
    );
  }
}
