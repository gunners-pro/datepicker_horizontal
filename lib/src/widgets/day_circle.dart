import 'package:flutter/material.dart';

/// A widget to show a circle shape and a day as text
class DayCircle extends StatelessWidget {
  /// Text of the day
  final int day;

  /// Color of the text day
  final Color color;

  /// Create a [DayCircle] widget
  ///
  /// The [day] and [color] must not be null
  const DayCircle({super.key, required this.day, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Text(
        '$day',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    );
  }
}
