import 'package:flutter/material.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/home_banner_side_button.dart';
import 'package:netflix/presentation/new_and_hot/widgets/video_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String description;
  const EveryonesWatchingWidget({
    super.key,
    required this.posterPath,
    required this.movieName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        Text(
          "Tall Girl 2",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        kHeight,
        Text(
          "This hit sitcom follows the merry misadventures of six 20-something pals as they navigate the pitfalls of work, life and love in 1990s Manhattan.",
          style: TextStyle(color: kGreyColor),
        ),
        kHeight50,
        VideoWidget(url: newAndHotTempImage),
        kHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            HomeBannerSideButton(
              icon: Icons.share,
              title: "Share",
              iconSize: 25,
              textSize: 16,
              bold: false,
            ),
            kWidth,
            HomeBannerSideButton(
              icon: Icons.add,
              title: "My List",
              iconSize: 25,
              textSize: 16,
              bold: false,
            ),
            kWidth,
            HomeBannerSideButton(
              icon: Icons.play_arrow,
              title: "Play",
              iconSize: 25,
              textSize: 16,
              bold: false,
            ),
            kWidth
          ],
        )
      ],
    );
  }
}
