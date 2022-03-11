import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChart2 extends StatefulWidget {
  const BarChart2({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BarChart2State();
}

class BarChart2State extends State<BarChart2> {
  final Color leftBarColor = const Color(0xff53fdd7);
  final Color rightBarColor = const Color(0xffff5182);
  final double width = 160;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(1, -5, 15);

    final items = [
      barGroup1,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bar Chart 2'),
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: 350,
            height: 300,
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              color: Colors.grey.shade100,
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      child: BarChart(
                        BarChartData(
                          maxY: 20,
                          titlesData: FlTitlesData(
                            show: true,
                            rightTitles: SideTitles(showTitles: false),
                            topTitles: SideTitles(showTitles: false),
                            bottomTitles: SideTitles(
                              showTitles: true,
                              getTextStyles: (context, value) =>
                                  const TextStyle(
                                      color: Color(0xff7589a2),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                              margin: 20,
                            ),
                            leftTitles: SideTitles(
                              showTitles: false,
                              getTextStyles: (context, value) =>
                                  const TextStyle(
                                      color: Color(0xff7589a2),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                              margin: 8,
                              reservedSize: 12,
                              interval: 20,
                              getTitles: (value) {
                                if (value == 0) {
                                  return '1K';
                                } else if (value == 10) {
                                  return '5K';
                                } else if (value == 19) {
                                  return '10K';
                                } else {
                                  return '';
                                }
                              },
                            ),
                          ),
                          borderData: FlBorderData(
                            show: false,
                          ),
                          barGroups: showingBarGroups,
                          gridData: FlGridData(show: false),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(barsSpace: 4, x: x, barRods: [
      BarChartRodData(
        y: y1,
        colors: [Colors.blue.shade800],
        width: width,
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      BarChartRodData(
        y: y2,
        colors: [Colors.blue],
        width: width,
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
      ),
    ]);
  }
}
