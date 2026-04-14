import 'package:flutter/material.dart';

class TimeSelectionSection extends StatefulWidget {
  const TimeSelectionSection({super.key});

  @override
  State<TimeSelectionSection> createState() => _TimeSelectionSectionState();
}

class _TimeSelectionSectionState extends State<TimeSelectionSection> {
  int selectedPeriodIndex = 0;
  String? selectedTime = '8:30 AM';
  final List<String> periods = ['Morning', 'Afternoon', 'Evening', 'Night'];
  final Map<String, List<String>> timeSlots = {
    'Morning': [
      '8:00 AM',
      '8:30 AM',
      '9:00 AM',
      '9:30 AM',
      '10:00 AM',
      '10:30 AM',
    ],
    'Afternoon': [
      '12:00 PM',
      '12:30 PM',
      '1:00 PM',
      '1:30 PM',
      '2:00 PM',
      '2:30 PM',
    ],
    'Evening': [
      '5:00 PM',
      '5:30 PM',
      '6:00 PM',
      '6:30 PM',
      '7:00 PM',
      '7:30 PM',
    ],
    'Night': [
      '8:00 PM',
      '8:30 PM',
      '9:00 PM',
      '9:30 PM',
      '10:00 PM',
      '10:30 PM',
    ],
  };

  @override
  Widget build(BuildContext context) {
    final currentPeriod = periods[selectedPeriodIndex];
    final slots = timeSlots[currentPeriod]!;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Time',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),

          // Period selector
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: const Color(0xFFF0F0F5),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: List.generate(periods.length, (index) {
                final isSelected = selectedPeriodIndex == index;
                return Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() {
                      selectedPeriodIndex = index;
                      selectedTime = null;
                    }),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF4C6FFF)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        periods[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: isSelected ? Colors.white : Colors.black54,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),

          // Time grid
          GridView.builder(
            padding: EdgeInsets.symmetric(vertical: 20),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: slots.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 2.8,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              final time = slots[index];
              final isSelected = selectedTime == time;
              return GestureDetector(
                onTap: () => setState(() => selectedTime = time),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: isSelected
                          ? const Color(0xFF4C6FFF)
                          : const Color(0xFFE8E8EE),
                      width: isSelected ? 2 : 1,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      time,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.w400,
                        color: isSelected
                            ? const Color(0xFF4C6FFF)
                            : Colors.black87,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),

          // Bottom bar
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFE8E8EE)),
                ),
                child: const Icon(
                  Icons.chat_bubble_outline,
                  size: 20,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: selectedTime != null ? () {} : null,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: const Color(0xFF4C6FFF),
                    disabledBackgroundColor: const Color(
                      0xFF4C6FFF,
                    ).withValues(alpha: 0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Book Now',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
