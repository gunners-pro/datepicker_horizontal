import 'package:flutter/material.dart';

/// A widget to show a week day label
class WeekdayLabel extends StatelessWidget {
  /// Text of the label
  final String label;

  /// Color of the label
  final Color color;

  /// Create a [WeekdayLabel] widget
  ///
  /// The [label] and [color] must not be null
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
