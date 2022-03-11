import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'BarChart/bar_chart_1.dart';
import 'BarChart/bar_chart_2.dart';
import 'BarChart/bar_chart_3.dart';
import 'BarChart/bar_chart_4.dart';
import 'BarChart/bar_chart_5.dart';
import 'ChartList/line_chart_1.dart';
import 'ChartList/pie_chart.dart';
import 'CommonWidget/main_page_list_tile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // ignore: prefer_const_constructors
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Color.fromRGBO(0, 137, 116, 1),
        ),
      ),
      home: const MyHomePage(title: 'Chart'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            MainPageListTile(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const BarChart1(),
                  ),
                );
              },
              text: 'Bar Chart 1',
            ),
            const SizedBox(
              height: 16,
            ),
            MainPageListTile(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const BarChart2(),
                  ),
                );
              },
              text: 'Bar Chart 2',
            ),
            const SizedBox(
              height: 16,
            ),
            MainPageListTile(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const BarChart3(),
                  ),
                );
              },
              text: 'Bar Chart 3',
            ),
            const SizedBox(
              height: 16,
            ),
            MainPageListTile(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const BarChart4(),
                  ),
                );
              },
              text: 'Bar Chart 4',
            ),
            const SizedBox(
              height: 16,
            ),
            MainPageListTile(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const BarChart5(),
                  ),
                );
              },
              text: 'Bar Chart 5',
            ),
            const SizedBox(
              height: 16,
            ),
            MainPageListTile(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => LineChartDemo1(),
                  ),
                );
              },
              text: 'Line Chart 1',
            ),
            const SizedBox(
              height: 16,
            ),
            MainPageListTile(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const PieChartDemo(),
                  ),
                );
              },
              text: 'Pie Chart',
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
