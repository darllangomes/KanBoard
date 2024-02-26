import 'package:flutter/material.dart';
import 'package:kandoard/components/bar_graph.dart';
import 'package:kandoard/shared/app_colors.dart';

class ChartView extends StatefulWidget {
  const ChartView({super.key});
  static const routeName = '/charts';
  @override
  ChartViewState createState() {
    return ChartViewState();
  }
}

class ChartViewState extends State<ChartView> {
  List<double> test = [4.0, 10.0, 9.0, 1.0, 2.0, 3.0, 0.0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: AppBar(
        backgroundColor: AppColors.blue,
        iconTheme: IconThemeData(color: AppColors.grey),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        actionsIconTheme: const IconThemeData(),
        title: Text(
          'Métricas Kanban',
          style: TextStyle(
              color: AppColors.grey,
              fontSize: 24,
              fontWeight: FontWeight.w200,
              fontStyle: FontStyle.italic),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                    children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Throughput',
                style: TextStyle(fontSize: 24, color: AppColors.blue, fontWeight: FontWeight.w300),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            
            SizedBox(height: 300, child: BarGraph(weeklySummary: test,),)
                    ],
                  ),
          )),
    );
  }
}
