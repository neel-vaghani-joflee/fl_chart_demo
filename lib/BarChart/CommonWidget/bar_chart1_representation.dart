import 'package:flutter/material.dart';

class BarChart1Representation extends StatelessWidget {
  const BarChart1Representation(
      {Key? key, required this.title, required this.color})
      : super(key: key);
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          height: 8,
          width: 8,
          decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(100))),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
