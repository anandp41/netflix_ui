import 'package:flutter/material.dart';
import 'package:netflix/core/colors.dart';

class HomeBannerSideButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final double iconSize;
  final double textSize;
  final bool bold;
  const HomeBannerSideButton(
      {super.key,
      required this.icon,
      required this.title,
      this.iconSize = 30,
      this.textSize = 18,
      this.bold = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kWhiteColor,
          size: iconSize,
        ),
        Text(
          title,
          style: TextStyle(
              fontSize: textSize,
              fontWeight: bold ? FontWeight.bold : FontWeight.normal),
        )
      ],
    );
  }
}
