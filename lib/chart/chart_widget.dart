import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:weight_trend/chart/weight.dart';

class ChartWidget extends StatelessWidget {
  ChartWidget({required this.buildContext, required this.weight});

  final BuildContext buildContext;
  Weight weight;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      lineChartData,
      duration: const Duration(milliseconds: 250),
    );
  }

  LineChartData get lineChartData => LineChartData(
        lineTouchData: lineTouchData,
        gridData: gridData,
        titlesData: titlesData,
        borderData: borderData,
        lineBarsData: lineBarsData,
        minX: 0,
        maxX: weight.dates.length.toDouble() - 1,
        maxY: 77.7,

        ///replace with MaxValue from the selected range of weight data
        minY: 72,

        ///replace with MinValue from the selected range of weight data
      );

  LineTouchData get lineTouchData => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
      );

  FlTitlesData get titlesData => FlTitlesData(
        bottomTitles: AxisTitles(sideTitles: bottomTitles),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(sideTitles: leftTitles()),
      );

  List<LineChartBarData> get lineBarsData => [
        lineChartBarData1,
      ];

  SideTitles leftTitles() => SideTitles(
        getTitlesWidget: leftTitleWidgets,
        showTitles: true,
        interval: 1,
        reservedSize: 15,
      );

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    return Text(
      '${value.toInt()}',
      style: Theme.of(buildContext).textTheme.labelSmall,
      textAlign: TextAlign.right,
    );
  }

  SideTitles get bottomTitles => SideTitles(
        getTitlesWidget: bottomTitleWidgets,
        showTitles: true,
        interval: 15,
        reservedSize: 25,
      );

  Widget bottomTitleWidgets(double xValue, TitleMeta meta) {
    DateTime currentDate = weight.dates[xValue.toInt()];

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: Text(
        '${currentDate.day}/${currentDate.month}',
        style: Theme.of(buildContext).textTheme.labelSmall,
        textAlign: TextAlign.center,
      ),
    );
  }

  FlGridData get gridData => const FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: 1.0,
      );

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: Border(
          bottom: BorderSide(color: Colors.grey.withOpacity(0.2), width: 1),
          left: const BorderSide(color: Colors.transparent),
          right: const BorderSide(color: Colors.transparent),
          top: const BorderSide(color: Colors.transparent),
        ),
      );

  LineChartBarData get lineChartBarData1 => LineChartBarData(
      isCurved: true,
      color: Colors.green,
      barWidth: 1.5,
      isStrokeCapRound: true,
      dotData: const FlDotData(show: false),
      belowBarData: BarAreaData(show: false),
      spots: weight.spots);
}
