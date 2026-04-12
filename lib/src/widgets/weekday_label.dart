import 'package:flutter/material.dart';

class WeekdayLabel extends StatelessWidget {
  final String label;
  final Color color;

  const WeekdayLabel({super.key, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    );
  }
}
