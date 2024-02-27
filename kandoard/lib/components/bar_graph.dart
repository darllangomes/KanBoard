import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/widgets.dart';
import 'package:kandoard/model/bar_graph/bar_data.dart';
import 'package:kandoard/shared/app_colors.dart';
import 'package:kandoard/shared/app_measures.dart';

class BarGraph extends StatelessWidget {
  final List weeklySummary;
  List get getWeeklySymmary => weeklySummary;
  const BarGraph({super.key, required this.weeklySummary});

  @override
  Widget build(BuildContext context) {
    BarData mybarData = BarData(
        sunAmount: weeklySummary[0],
        monAmount: weeklySummary[1],
        tueAmount: weeklySummary[2],
        wedAmount: weeklySummary[3],
        thurAmount: weeklySummary[4],
        friAmount: weeklySummary[5],
        satAmount: weeklySummary[6]);
    return BarChart(BarChartData(
        backgroundColor: AppColors.grey,
        titlesData: FlTitlesData(
            show: true,
            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: const AxisTitles(
                axisNameWidget: Text('Cartões Concluídos'),
                sideTitles: SideTitles(showTitles: true, reservedSize: 32)),
            bottomTitles: AxisTitles(
                axisNameWidget: const Text(''),
                sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 32,
                    interval: 3,
                    getTitlesWidget: (value, meta) {
                      String xTitle = '';
                      switch (value.toInt()) {
                        case 0:
                          xTitle = 'Seg';
                        case 1:
                          xTitle = 'Ter';
                          break;
                        case 2:
                          xTitle = 'Qua';
                          break;
                        case 3:
                          xTitle = 'Qui';
                          break;
                        case 4:
                          xTitle = 'Sex';
                          break;
                        case 5:
                          xTitle = 'Sab';
                          break;
                        case 6:
                          xTitle = 'Dom';
                          break;
                      }
                      return Text(xTitle);
                    }))),
        maxY: 20,
        minY: 0,
        groupsSpace: 1,
        barGroups: [
          BarChartGroupData(x: 0, barRods: [
            BarChartRodData(toY: mybarData.monAmount, color: AppColors.blue, width: AppMeasures.barGraphWidth, borderRadius: BorderRadius.only(topLeft: Radius.circular(AppMeasures.borderRadius), topRight: Radius.circular(AppMeasures.borderRadius),))
          ]),
          BarChartGroupData(x: 1, barRods: [
            BarChartRodData(toY: mybarData.tueAmount, color: AppColors.blue, width: AppMeasures.barGraphWidth, borderRadius: BorderRadius.only(topLeft: Radius.circular(AppMeasures.borderRadius), topRight: Radius.circular(AppMeasures.borderRadius),))
          ]),
          BarChartGroupData(x: 2, barRods: [
            BarChartRodData(toY: mybarData.wedAmount, color: AppColors.blue, width: AppMeasures.barGraphWidth, borderRadius: BorderRadius.only(topLeft: Radius.circular(AppMeasures.borderRadius), topRight: Radius.circular(AppMeasures.borderRadius),))
          ]),
          BarChartGroupData(x: 3, barRods: [
            BarChartRodData(toY: mybarData.thurAmount, color: AppColors.blue, width: AppMeasures.barGraphWidth, borderRadius: BorderRadius.only(topLeft: Radius.circular(AppMeasures.borderRadius), topRight: Radius.circular(AppMeasures.borderRadius),))
          ]),
          BarChartGroupData(x: 4, barRods: [
            BarChartRodData(toY: mybarData.friAmount, color: AppColors.blue, width: AppMeasures.barGraphWidth, borderRadius: BorderRadius.only(topLeft: Radius.circular(AppMeasures.borderRadius), topRight: Radius.circular(AppMeasures.borderRadius),))
          ]),
          BarChartGroupData(x: 5, barRods: [
            BarChartRodData(toY: mybarData.satAmount, color: AppColors.blue, width: AppMeasures.barGraphWidth, borderRadius: BorderRadius.only(topLeft: Radius.circular(AppMeasures.borderRadius), topRight: Radius.circular(AppMeasures.borderRadius),))
          ]),
          BarChartGroupData(x: 6, barRods: [
            BarChartRodData(toY: mybarData.sunAmount, color: AppColors.blue, width: AppMeasures.barGraphWidth, borderRadius: BorderRadius.only(topLeft: Radius.circular(AppMeasures.borderRadius), topRight: Radius.circular(AppMeasures.borderRadius),))
          ]),
        ]));
  }
}
