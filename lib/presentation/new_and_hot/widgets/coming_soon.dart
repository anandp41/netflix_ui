import 'package:flutter/material.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/home_banner_side_button.dart';
import 'package:netflix/presentation/new_and_hot/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;
  const ComingSoonWidget({
    super.key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterPath,
    required this.movieName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                month,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: kGreyColor),
              ),
              Text(
                day,
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: kWhiteColor),
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 420,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(url: posterPath),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      movieName,
                      maxLines: 1,
                      style: const TextStyle(
                          letterSpacing: -2,
                          fontSize: 28,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Row(
                    children: [
                      HomeBannerSideButton(
                        icon: Icons.notifications_none_outlined,
                        title: "Remind me",
                        iconSize: 20,
                        textSize: 12,
                        bold: false,
                      ),
                      kWidth,
                      HomeBannerSideButton(
                        icon: Icons.info_outline,
                        title: "Info",
                        iconSize: 20,
                        textSize: 12,
                        bold: false,
                      ),
                      kWidth
                    ],
                  )
                ],
              ),
              Text("Coming on $day $month"),
              kHeight,
              Text(
                movieName,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              kHeight,
              Expanded(
                child: Text(
                  description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                  style: const TextStyle(
                    color: kGreyColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
