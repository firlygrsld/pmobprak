import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:pacepal/BarGraph/bar_data.dart';

class MyBarGraph extends StatelessWidget {
  final List weeklySummary;
  final double graphHeight;
  const MyBarGraph(
      {super.key, required this.weeklySummary, this.graphHeight = 100});

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
        minAmount: weeklySummary[0],
        senAmount: weeklySummary[1],
        selAmount: weeklySummary[2],
        rabAmount: weeklySummary[3],
        kamAmount: weeklySummary[4],
        jumAmount: weeklySummary[5],
        sabAmount: weeklySummary[6]);
    myBarData.initializeBarData();
    return BarChart(BarChartData(
      maxY: 100,
      minY: 0,
      gridData: FlGridData(show: false),
      borderData: FlBorderData(show: false),
      titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                  showTitles: true, getTitlesWidget: getBottomTitles))),
      barGroups: myBarData.barData
          .map(
            (data) => BarChartGroupData(
              x: data.x,
              barRods: [
                BarChartRodData(
                    toY: data.y,
                    color: Colors.orange,
                    width: 25,
                    borderRadius: BorderRadius.circular(4),
                    backDrawRodData: BackgroundBarChartRodData(
                      show: true,
                      toY: 100,
                      color: Colors.grey[200],
                    ))
              ],
            ),
          )
          .toList(),
    ));
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );

  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text('M', style: style);
      break;
    case 1:
      text = const Text('S', style: style);
      break;
    case 2:
      text = const Text('S', style: style);
      break;
    case 3:
      text = const Text('R', style: style);
      break;
    case 4:
      text = const Text('K', style: style);
      break;
    case 5:
      text = const Text('J', style: style);
      break;
    case 6:
      text = const Text('S', style: style);
      break;
    default:
      text = const Text('', style: style);
  }

  return SideTitleWidget(child: text, axisSide: meta.axisSide);
}
