import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LineChartDemo1 extends StatelessWidget {
  final spots = const [
    FlSpot(0, 400),
    FlSpot(1, 100),
    FlSpot(2, 300),
    FlSpot(3, 300),
    FlSpot(4, 200),
    FlSpot(5, 200),
  ];

  final spots2 = const [
    FlSpot(0, 400),
    FlSpot(1, 520),
    FlSpot(2, 310),
    FlSpot(3, 290),
    FlSpot(4, 180),
    FlSpot(5, 200),
  ];

  late double minSpotX, maxSpotX;
  late double minSpotY, maxSpotY;

  LineChartDemo1({Key? key}) : super(key: key) {
    minSpotX = spots.first.x;
    maxSpotX = spots.first.x;
    minSpotY = spots.first.y;
    maxSpotY = spots.first.y;

    for (var spot in spots) {
      if (spot.x > maxSpotX) {
        maxSpotX = spot.x;
      }

      if (spot.x < minSpotX) {
        minSpotX = spot.x;
      }

      if (spot.y > maxSpotY) {
        maxSpotY = spot.y;
      }

      if (spot.y < minSpotY) {
        minSpotY = spot.y;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(colors: [
                Colors.grey.shade100,
                Colors.grey.shade100,
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 22.0, bottom: 20),
              child: SizedBox(
                width: 300,
                height: 200,
                child: LineChart(
                  LineChartData(
                    lineTouchData: LineTouchData(enabled: false),
                    lineBarsData: [
                      LineChartBarData(
                        colors: [
                          Colors.green,
                          // Colors.orangeAccent,
                        ],
                        spots: reverseSpots(spots, minSpotY, maxSpotY),
                        isCurved: true,
                        isStrokeCapRound: true,
                        barWidth: 3,
                        dotData: FlDotData(
                          show: false,
                          getDotPainter: (spot, percent, barData, index) =>
                              FlDotCirclePainter(
                                  radius: 12,
                                  color: Colors.deepOrange.withOpacity(0.5)),
                        ),
                      ),
                      LineChartBarData(
                        colors: [
                          Colors.red,
                        ],
                        spots: reverseSpots(spots2, minSpotY, maxSpotY),
                        isCurved: true,
                        isStrokeCapRound: true,
                        barWidth: 3,
                        dotData: FlDotData(
                          show: false,
                        ),
                      ),
                    ],
                    minY: 0,
                    maxY: maxSpotY + minSpotY,
                    titlesData: FlTitlesData(
                      leftTitles: SideTitles(
                        showTitles: true,
                        getTitles: (double value) {
                          final intValue =
                              reverseY(value, minSpotY, maxSpotY).toInt();

                          if (intValue == (maxSpotY + minSpotY)) {
                            return '';
                          }

                          return intValue.toString();
                        },
                        getTextStyles: (context, value) => const TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        margin: 16,
                      ),
                      rightTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 0,
                        getTitles: (double value) {
                          final intValue =
                              reverseY(value, minSpotY, maxSpotY).toInt();

                          if (intValue == (maxSpotY + minSpotY)) {
                            return '';
                          }

                          return intValue.toString();
                        },
                        getTextStyles: (context, value) => const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        margin: 16,
                      ),
                      bottomTitles: SideTitles(showTitles: false),
                      topTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 28,
                        margin: 8,
                        getTextStyles: (context, value) => const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        getTitles: (double value) {
                          return value.toInt().toString();
                        },
                      ),
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: const Border(
                        left: BorderSide(color: Colors.black),
                        top: BorderSide(color: Colors.black),
                        bottom: BorderSide(color: Colors.transparent),
                        right: BorderSide(color: Colors.transparent),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  double reverseY(double y, double minX, double maxX) {
    return (maxX + minX) - y;
  }

  List<FlSpot> reverseSpots(List<FlSpot> inputSpots, double minY, double maxY) {
    return inputSpots.map((spot) {
      return spot.copyWith(y: (maxY + minY) - spot.y);
    }).toList();
  }
}
