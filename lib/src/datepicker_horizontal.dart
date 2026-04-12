import 'package:flutter/material.dart';

class DatePickerHorizontal extends StatefulWidget {
  final DateTime initialDate;
  final int daysCount;
  final ValueChanged<DateTime>? onDateSelected;

  final Color selectedColor;
  final Color textColor;
  final Color selectedWeekDayTextColor;
  final Color selectedDayTextColor;

  final double itemWidth;
  final double itemHeight;

  const DatePickerHorizontal(
      {super.key,
      required this.initialDate,
      this.daysCount = 30,
      this.onDateSelected,
      this.selectedColor = Colors.blue,
      this.textColor = Colors.black,
      this.selectedWeekDayTextColor = Colors.white,
      this.selectedDayTextColor = Colors.black,
      this.itemWidth = 50,
      this.itemHeight = 80});

  @override
  State<DatePickerHorizontal> createState() => _DatePickerHorizontalState();
}

class _DatePickerHorizontalState extends State<DatePickerHorizontal> {
  late DateTime selectedDate;
  late List<DateTime> dates;

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  @override
  void initState() {
    super.initState();

    selectedDate = widget.initialDate;
    dates = List.generate(
      widget.daysCount,
      (index) => widget.initialDate.add(Duration(days: index)),
    );
  }

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
            final isSelected = _isSameDay(date, selectedDate);

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedDate = date;
                });

                widget.onDateSelected?.call(date);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                width: widget.itemWidth,
                margin: const EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                    color: isSelected ? widget.selectedColor : Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border:
                        Border.all(color: widget.selectedColor, width: 1.2)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        _weekday(date.weekday),
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: isSelected
                              ? widget.selectedWeekDayTextColor
                              : widget.textColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Text(
                        "${date.day}",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: isSelected
                                ? widget.selectedDayTextColor
                                : widget.textColor),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  String _weekday(int weekday) {
    const days = ["Seg", "Ter", "Qua", "Qui", "Sex", "Sab", "Dom"];

    return days[weekday - 1];
  }
}
