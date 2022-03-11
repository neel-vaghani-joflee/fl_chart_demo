import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartDemo extends StatefulWidget {
  const PieChartDemo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PieChartDemoState();
}

class PieChartDemoState extends State {
  int touchedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 6,
      child: Card(
        color: Colors.white,
        child: Container(
          height: 200,
          width: 200,
          child: PieChart(
            PieChartData(
              pieTouchData: PieTouchData(
                  touchCallback: (FlTouchEvent event, pieTouchResponse) {
                setState(() {
                  if (!event.isInterestedForInteractions ||
                      pieTouchResponse == null ||
                      pieTouchResponse.touchedSection == null) {
                    touchedIndex = -1;
                    return;
                  }
                  touchedIndex =
                      pieTouchResponse.touchedSection!.touchedSectionIndex;
                });
              }),
              borderData: FlBorderData(
                show: true,
              ),
              startDegreeOffset: 10,
              sectionsSpace: 2,
              centerSpaceRadius: 20,
              sections: showingSections(),
            ),
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 30.0 : 16.0;
      final radius = isTouched ? 135.0 : 120.0;
      final widgetSize = isTouched ? 30.0 : 40.0;

      return PieChartSectionData(
        color: const Color(0xff0293ee),
        value: 50,
        title: '50%',
        radius: radius,
        titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: const Color(0xffffffff)),
        badgePositionPercentageOffset: 20,
      );
    });
  }
}
