import 'package:bmi_calculator/constants/constants.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  final String label;
  final IconData icon;
  IconContent(this.label, this.icon);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: labelTextStyle,
        ),
      ],
    );
  }
}
