import 'dart:ui';

import 'package:example/widgets/glass_button.dart';
import 'package:flutter/material.dart';
import 'package:datepicker_horizontal/datepicker_horizontal.dart';

void main() {
  runApp(const MyApp());
}

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
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(35),
                      bottomRight: Radius.circular(35),
                    ),
                  ),
                  height: 400,
                  clipBehavior: Clip.hardEdge,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          "assets/images/doctor.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 60,
                        left: 20,
                        child: GlassButton(icon: Icons.keyboard_arrow_left),
                      ),
                      Positioned(
                        top: 60,
                        right: 20,
                        child: GlassButton(icon: Icons.settings),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 60),
                DatePickerHorizontal(initialDate: DateTime.now()),
              ],
            ),

            Positioned(
              top: 340,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 35),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.7),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 30,
                            offset: Offset(-2, -2),
                            blurStyle: BlurStyle.outer,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      child: Column(
                        spacing: 8,
                        children: [
                          Text(
                            "Dr. Ayla Isobelle",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                spacing: 4,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star_rate_rounded,
                                    color: Colors.yellow[600],
                                  ),
                                  Text("4.5"),
                                ],
                              ),
                              Row(
                                spacing: 4,
                                children: [
                                  Icon(Icons.pin_drop_outlined, size: 18),
                                  Text("500m"),
                                ],
                              ),
                              Row(
                                spacing: 4,
                                children: [
                                  Icon(
                                    Icons.medical_information_outlined,
                                    size: 18,
                                  ),
                                  Text("Neurologist"),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
