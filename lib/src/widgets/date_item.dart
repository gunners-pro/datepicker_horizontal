import 'package:flutter/material.dart';
import 'day_circle.dart';
import 'weekday_label.dart';

class DateItem extends StatelessWidget {
  final DateTime date;
  final bool isSelected;
  final String weekdayLabel;
  final double width;

  final Color selectedColor;
  final Color textColor;
  final Color selectedWeekDayTextColor;
  final Color selectedDayTextColor;

  final ValueChanged<DateTime> onTap;

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
