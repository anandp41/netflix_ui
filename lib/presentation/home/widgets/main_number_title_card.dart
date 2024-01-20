import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/number_card.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

class MainNumberTitleCard extends StatelessWidget {
  const MainNumberTitleCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MainTitle(title: 'Top 10 TV Shows in India Today'),
          kHeight,
          LimitedBox(
            maxHeight: 250,
            child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  10,
                  (index) => NumberCard(index: index),
                )),
          ),
        ],
      ),
    );
  }
}
