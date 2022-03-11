import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'CommonWidget/bar_chart1_representation.dart';

class BarChart5 extends StatefulWidget {
  const BarChart5({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BarChart5State();
}

class BarChart5State extends State<BarChart5> {
  final Color black = Colors.blue.shade700;
  final Color green = Colors.blue.shade900;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bar Chart 5'),
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
                          show: false,
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
                            margin: 2,
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
        x: 5,
        barsSpace: 3,
        barRods: [
          BarChartRodData(
            width: 160,
            y: 6000,
            colors: [
              Colors.transparent,
            ],
            rodStackItems: [
              BarChartRodStackItem(0, 5000, black),
            ],
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          BarChartRodData(

            width: 160,
            y: 1000,
            colors: [
              Colors.transparent,
            ],
            rodStackItems: [
              BarChartRodStackItem(0, 1000, green),
            ],
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
        ],
      ),
    ];
  }
}
