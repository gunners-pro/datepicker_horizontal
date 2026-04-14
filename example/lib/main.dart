import 'package:example/widgets/time_selection_section.dart';
import 'package:flutter/material.dart';
import 'package:datepicker_horizontal/datepicker_horizontal.dart';
import 'widgets/hero_image.dart';
import 'widgets/doctor_info_card.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Stack(
          children: [
            Column(
              children: [
                const HeroImage(),
                const SizedBox(height: 60),
                DatePickerHorizontal(initialDate: DateTime.now()),
                const TimeSelectionSection(),
              ],
            ),
            const DoctorInfoCard(),
          ],
        ),
      ),
    );
  }
}
