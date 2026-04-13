import 'package:flutter/material.dart';
import 'day_circle.dart';
import 'weekday_label.dart';

/// A widget to show a date
class DateItem extends StatelessWidget {
  /// Date of the widget
  final DateTime date;

  /// Handle if item is selected
  final bool isSelected;

  /// Text weekday
  final String weekdayLabel;

  /// Width for [DateItem]
  final double width;

  /// Color of text selected
  final Color selectedColor;

  /// Color of text
  final Color textColor;

  /// Color of selectedWeekDayText
  final Color selectedWeekDayTextColor;

  /// Color of selectedDayText
  final Color selectedDayTextColor;

  /// Function to handle with taps on [DateItem]
  final ValueChanged<DateTime> onTap;

  /// create a [DateItem] widget
  ///
  /// The [date],[isSelected],[weekdayLabel],[width],[selectedColor],
  /// [textColor],[selectedWeekDayTextColor],[selectedDayTextColor],
  /// [onTap] must not be null
  const DateItem({
    super.key,
    required this.date,
    required this.isSelected,
    required this.weekdayLabel,
    required this.width,
    required this.selectedColor,
    required this.textColor,
    required this.selectedWeekDayTextColor,
    required this.selectedDayTextColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(date),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        width: width,
        margin: const EdgeInsets.symmetric(horizontal: 3),
        decoration: BoxDecoration(
          color: isSelected ? selectedColor : Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: selectedColor, width: 1.2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            WeekdayLabel(
              label: weekdayLabel,
              color: isSelected ? selectedWeekDayTextColor : textColor,
            ),
            DayCircle(
              day: date.day,
              color: isSelected ? selectedDayTextColor : textColor,
            ),
          ],
        ),
      ),
    );
  }
}
