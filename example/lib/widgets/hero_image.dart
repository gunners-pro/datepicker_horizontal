import 'package:flutter/material.dart';
import 'package:example/widgets/glass_button.dart';

class HeroImage extends StatelessWidget {
  const HeroImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/images/doctor.jpg', fit: BoxFit.cover),
          ),
          const Positioned(
            top: 60,
            left: 20,
            child: GlassButton(icon: Icons.keyboard_arrow_left),
          ),
          const Positioned(
            top: 60,
            right: 20,
            child: GlassButton(icon: Icons.settings),
          ),
        ],
      ),
    );
  }
}
