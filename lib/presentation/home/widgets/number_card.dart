import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';

class NumberCard extends StatelessWidget {
  final int index;
  const NumberCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 35,
              height: 150,
            ),
            Container(
                width: 130,
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: kBorderRadiusCircular10,
                    image: const DecorationImage(
                        image: NetworkImage(
                            "https://media.themoviedb.org/t/p/w220_and_h330_face/w46Vw536HwNnEzOa7J24YH9DPRS.jpg"),
                        fit: BoxFit.cover))),
          ],
        ),
        Positioned(
          bottom: -35,
          left: 5,
          child: BorderedText(
            strokeWidth: 8.0,
            strokeColor: Colors.white54,
            child: Text(
              "${index + 1}",
              style: const TextStyle(
                  color: kBlackColor,
                  decoration: TextDecoration.none,
                  fontSize: 120,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}
