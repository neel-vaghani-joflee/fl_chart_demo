import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'CommonWidget/bar_chart1_representation.dart';

class BarChart1 extends StatefulWidget {
  const BarChart1({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BarChart1State();
}

class BarChart1State extends State<BarChart1> {
  final Color black = Colors.black;
  final Color green = Colors.green;
  final Color red = Colors.red;
  final Color blue = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bar Chart 1'),
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 1.66,
          child: Container(
            // height: 200,
            // width: 200,
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.grey.shade100,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.center,
                        barTouchData: BarTouchData(
                          enabled: false,
                        ),
                        titlesData: FlTitlesData(
                          show: true,
                          bottomTitles: SideTitles(
                            showTitles: true,
                            getTextStyles: (context, value) => const TextStyle(
                                color: Color(0xff939393), fontSize: 10),
                            margin: 10,
                            getTitles: (double value) {
                              switch (value.toInt()) {
                                case 0:
                                  return 'Apr';
                                case 1:
                                  return 'May';
                                case 2:
                                  return 'Jun';
                                case 3:
                                  return 'Jul';
                                case 4:
                                  return 'Aug';
                                default:
                                  return '';
                              }
                            },
                          ),
                          leftTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 30,
                            getTextStyles: (context, value) => const TextStyle(
                                color: Color(
                                  0xff939393,
                                ),
                                fontSize: 10),
                            margin: 0,
                          ),
                          topTitles: SideTitles(showTitles: false),
                          rightTitles: SideTitles(showTitles: false),
                        ),
                        gridData: FlGridData(
                          show: false,
                          checkToShowHorizontalLine: (value) => value % 10 == 0,
                          getDrawingHorizontalLine: (value) => FlLine(
                            color: const Color(0xffe7e8ec),
                            strokeWidth: 1,
                          ),
                        ),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        groupsSpace: 30,
                        barGroups: getData(),
                        backgroundColor: Colors.grey.shade100,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> getData() {
    return [
      BarChartGroupData(
        x: 0,
        barsSpace: 2,
        barRods: [
          BarChartRodData(
            y: -1000,
            colors: [
              Colors.transparent,
            ],
            rodStackItems: [
              BarChartRodStackItem(0, -500, black),
            ],
            borderRadius: const BorderRadius.all(Radius.zero),
          ),
          BarChartRodData(
            y: 1000,
            colors: [
              Colors.transparent,
            ],
            rodStackItems: [
              BarChartRodStackItem(0, 200, green),
            ],
            borderRadius: const BorderRadius.all(Radius.zero),
          ),
          BarChartRodData(
              y: 1000,
              colors: [
                Colors.transparent,
              ],
              rodStackItems: [
                BarChartRodStackItem(0, 150, red),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: 1000,
              colors: [
                Colors.transparent,
              ],
              rodStackItems: [
                BarChartRodStackItem(0, 900, blue),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 0,
        barsSpace: 2,
        barRods: [
          BarChartRodData(
            y: 1000,
            colors: [
              Colors.transparent,
            ],
            rodStackItems: [
              BarChartRodStackItem(0, 20, black),
            ],
            borderRadius: const BorderRadius.all(Radius.zero),
          ),
          BarChartRodData(
            y: 1000,
            colors: [
              Colors.transparent,
            ],
            rodStackItems: [
              BarChartRodStackItem(0, 600, green),
            ],
            borderRadius: const BorderRadius.all(Radius.zero),
          ),
          BarChartRodData(
              y: 1000,
              colors: [
                Colors.transparent,
              ],
              rodStackItems: [
                BarChartRodStackItem(0, 150, red),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: 1000,
              colors: [
                Colors.transparent,
              ],
              rodStackItems: [
                BarChartRodStackItem(0, 200, blue),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
    ];
  }
}
