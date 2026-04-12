import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'widgets/date_item.dart';

class DatePickerHorizontal extends StatefulWidget {
  final DateTime initialDate;
  final int daysCount;
  final ValueChanged<DateTime>? onDateSelected;
  final String? locale;

  final Color selectedColor;
  final Color textColor;
  final Color selectedWeekDayTextColor;
  final Color selectedDayTextColor;

  final double itemWidth;
  final double itemHeight;

  const DatePickerHorizontal({
    super.key,
    required this.initialDate,
    this.daysCount = 30,
    this.onDateSelected,
    this.locale,
    this.selectedColor = Colors.blue,
    this.textColor = Colors.black,
    this.selectedWeekDayTextColor = Colors.white,
    this.selectedDayTextColor = Colors.black,
    this.itemWidth = 50,
    this.itemHeight = 80,
  });

  @override
  State<DatePickerHorizontal> createState() => _DatePickerHorizontalState();
}

class _DatePickerHorizontalState extends State<DatePickerHorizontal> {
  DateTime? _selectedDate;
  List<DateTime>? _dates;

  DateTime get selectedDate => _selectedDate ??= widget.initialDate;

  List<DateTime> get dates => _dates ??= List.generate(
        widget.daysCount,
        (i) => widget.initialDate.add(Duration(days: i)),
      );

  void _onTap(DateTime date) {
    setState(() => _selectedDate = date);
    widget.onDateSelected?.call(date);
  }

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  String _formatWeekday(DateTime date) =>
      DateFormat.E(widget.locale).format(date);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.itemHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dates.length,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemBuilder: (context, index) {
          final date = dates[index];
          return DateItem(
            date: date,
            isSelected: _isSameDay(date, selectedDate),
            weekdayLabel: _formatWeekday(date),
            width: widget.itemWidth,
            selectedColor: widget.selectedColor,
            textColor: widget.textColor,
            selectedWeekDayTextColor: widget.selectedWeekDayTextColor,
            selectedDayTextColor: widget.selectedDayTextColor,
            onTap: _onTap,
          );
        },
      ),
    );
  }
}
