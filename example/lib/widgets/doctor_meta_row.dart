import 'package:flutter/material.dart';

class DoctorMetaRow extends StatelessWidget {
  const DoctorMetaRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        _MetaItem(
          icon: Icons.star_rate_rounded,
          label: '4.5',
          iconColor: Colors.amber,
        ),
        _MetaItem(icon: Icons.pin_drop_outlined, label: '500m'),
        _MetaItem(
          icon: Icons.medical_information_outlined,
          label: 'Neurologist',
        ),
      ],
    );
  }
}

class _MetaItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? iconColor;

  const _MetaItem({required this.icon, required this.label, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, size: 18, color: iconColor),
        Text(label),
      ],
    );
  }
}
