import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class _LineChart extends StatelessWidget {
  _LineChart({required this.isShowingMainData, required this.buildContext});

  final bool isShowingMainData;
  final BuildContext buildContext;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      lineChartData,
      duration: const Duration(milliseconds: 250),
    );
  }

  List<DateTime> dateTimes = [
    DateTime(2023, 9, 23),
    DateTime(2023, 9, 24),
    DateTime(2023, 9, 25),
    DateTime(2023, 9, 26),
    DateTime(2023, 9, 27),
    DateTime(2023, 9, 28),
    DateTime(2023, 9, 29),
    DateTime(2023, 9, 30),
    DateTime(2023, 10, 1),
    DateTime(2023, 10, 2),
    DateTime(2023, 10, 3),
    DateTime(2023, 10, 4),
    DateTime(2023, 10, 5),
    DateTime(2023, 10, 6),
    DateTime(2023, 10, 7),
    DateTime(2023, 10, 8),
    DateTime(2023, 10, 9),
    DateTime(2023, 10, 10),
    DateTime(2023, 10, 11),
    DateTime(2023, 10, 12),
    DateTime(2023, 10, 13),
    DateTime(2023, 10, 14),
    DateTime(2023, 10, 15),
    DateTime(2023, 10, 16),
    DateTime(2023, 10, 17),
    DateTime(2023, 10, 18),
    DateTime(2023, 10, 19),
    DateTime(2023, 10, 20),
    DateTime(2023, 10, 21),
    DateTime(2023, 10, 22),
    DateTime(2023, 10, 23),
    DateTime(2023, 10, 24),
    DateTime(2023, 10, 25),
    DateTime(2023, 10, 26),
    DateTime(2023, 10, 27),
    DateTime(2023, 10, 28),
    DateTime(2023, 10, 29),
    DateTime(2023, 10, 30),
    DateTime(2023, 10, 31),
    DateTime(2023, 11, 1),
    DateTime(2023, 11, 2),
    DateTime(2023, 11, 3),
    DateTime(2023, 11, 4),
    DateTime(2023, 11, 5),
    DateTime(2023, 11, 6),
    DateTime(2023, 11, 7),
    DateTime(2023, 11, 8),
    DateTime(2023, 11, 9),
    DateTime(2023, 11, 10),
    DateTime(2023, 11, 11),
    DateTime(2023, 11, 12),
    DateTime(2023, 11, 13),
    DateTime(2023, 11, 14),
    DateTime(2023, 11, 15)
  ];

  LineChartData get lineChartData => LineChartData(
        lineTouchData: lineTouchData,
        gridData: gridData,
        titlesData: titlesData,
        borderData: borderData,
        lineBarsData: lineBarsData,
        minX: 0,
        maxX: dateTimes.length.toDouble() - 1,
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
    DateTime currentDate = dateTimes[xValue.toInt()];

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
        spots: [
          FlSpot(0, 77.7),
          FlSpot(1, 77.7),
          FlSpot(2, 77.6),
          FlSpot(3, 76.8),
          FlSpot(4, 76.5),
          FlSpot(5, 76.6),
          FlSpot(6, 76.3),
          FlSpot(7, 75.9),
          FlSpot(8, 76.6),
          FlSpot(9, 76.9),
          FlSpot(10, 76.1),
          FlSpot(11, 76.2),
          FlSpot(12, 76),
          FlSpot(13, 75.5),
          FlSpot(14, 75.2),
          FlSpot(15, 76.1),
          FlSpot(16, 75.8),
          FlSpot(17, 75.1),
          FlSpot(18, 75.9),
          FlSpot(19, 76.1),
          FlSpot(20, 75.2),
          FlSpot(21, 75.3),
          FlSpot(22, 75.5),
          FlSpot(23, 75.8),
          FlSpot(24, 74.8),
          FlSpot(25, 75.4),
          FlSpot(26, 74.3),
          FlSpot(27, 74.2),
          FlSpot(28, 74.1),
          FlSpot(29, 74.8),
          FlSpot(30, 74.6),
          FlSpot(31, 74.1),
          FlSpot(32, 73.9),
          FlSpot(33, 73.1),
          FlSpot(34, 73.3),
          FlSpot(35, 74.3),
          FlSpot(36, 74.3),
          FlSpot(37, 74),
          FlSpot(38, 74),
          FlSpot(39, 73.5),
          FlSpot(40, 73.2),
          FlSpot(41, 72.8),
          FlSpot(42, 73.6),
          FlSpot(43, 73.5),
          FlSpot(44, 73.9),
          FlSpot(45, 73.8),
          FlSpot(46, 72.8),
          FlSpot(47, 72.8),
          FlSpot(48, 73),
          FlSpot(49, 73.6),
          FlSpot(50, 73.6),
          FlSpot(51, 73.5),
          FlSpot(52, 73.1),
          FlSpot(53, 73.1),
        ],
      );
}

class LineChartSample1 extends StatefulWidget {
  const LineChartSample1({super.key});

  @override
  State<StatefulWidget> createState() => LineChartSample1State();
}

class LineChartSample1State extends State<LineChartSample1> {
  late bool isShowingMainData;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(
                height: 37,
              ),
              Text(
                'Weight Trend',
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 37,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 16, left: 6),
                  child: _LineChart(isShowingMainData: isShowingMainData, buildContext: context),
                ),
              ),
              // const SizedBox(
              //   height: 500,
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
