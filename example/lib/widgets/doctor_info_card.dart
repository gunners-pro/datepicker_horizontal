import 'dart:ui';
import 'package:flutter/material.dart';
import 'doctor_meta_row.dart';

class DoctorInfoCard extends StatelessWidget {
  const DoctorInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 340,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.7),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 30,
                    offset: Offset(-2, -2),
                    blurStyle: BlurStyle.outer,
                    color: Colors.grey,
                  ),
                ],
              ),
              child: const Column(
                spacing: 8,
                children: [
                  Text(
                    'Dr. Ayla Isobelle',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  DoctorMetaRow(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
