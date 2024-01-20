import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/core/textstyles.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

const imageUrl =
    "https://media.themoviedb.org/t/p/w533_and_h300_bestv2/kXfqcdQKsToO0OUXHcrrNCHDBzO.jpg";

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(title: 'Top Searches'),
        kHeight,
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (ctx, index) => const TopSearchItemTile(),
              separatorBuilder: (ctx, index) => kHeight20,
              itemCount: 10),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.3,
          height: 60,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imageUrl), fit: BoxFit.cover)),
        ),
        const Expanded(
            child: Text(
          'Movie Name',
          style: topSearchItemTileTextstyle,
        )),
        const Icon(
          Icons.play_circle_fill_outlined,
          color: kWhiteColor,
          size: 40,
        )
      ],
    );
  }
}
