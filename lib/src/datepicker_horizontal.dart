import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'widgets/date_item.dart';

/// A customizable horizontal date picker widget.
///
/// Displays a scrollable list of dates starting from [initialDate],
/// allowing the user to select a date.
///
/// The selected date is returned via [onDateSelected].
///
/// Supports localization using the `intl` package.
///
/// Example:
/// ```dart
/// DatePickerHorizontal(
///   initialDate: DateTime.now(),
///   daysCount: 7,
///   locale: 'pt_BR',
///   onDateSelected: (date) {
///     print(date);
///   },
/// )
/// ```
class DatePickerHorizontal extends StatefulWidget {
  /// The initial date displayed in the picker.
  final DateTime initialDate;

  /// Number of days generated starting from [initialDate].
  final int daysCount;

  /// Callback triggered when a date is selected.
  final ValueChanged<DateTime>? onDateSelected;

  /// Locale used to format weekday names (e.g. 'en_US', 'pt_BR').
  final String? locale;

  /// Background color of the selected date item.
  final Color selectedColor;

  /// Default text color for unselected items.
  final Color textColor;

  /// Text color for the weekday when selected.
  final Color selectedWeekDayTextColor;

  /// Text color for the day number when selected.
  final Color selectedDayTextColor;

  /// Width of each date item.
  final double itemWidth;

  /// Height of the date picker.
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

  /// Handles tap on a date item.
  void _onTap(DateTime date) {
    setState(() => _selectedDate = date);
    widget.onDateSelected?.call(date);
  }

  /// Returns true if both dates represent the same calendar day.
  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  /// Formats the weekday label based on the provided [locale].
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
