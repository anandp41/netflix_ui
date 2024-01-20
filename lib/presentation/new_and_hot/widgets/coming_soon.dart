import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/home_banner_side_button.dart';
import 'package:netflix/presentation/new_and_hot/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          width: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "FEB",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: kGreyColor),
              ),
              Text(
                "11",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: kWhiteColor),
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 400,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'TALL GIRL 2',
                    style: TextStyle(
                        letterSpacing: -2,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
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
              Text("Coming on Friday"),
              kHeight,
              Text(
                "Tall Girl 2",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              kHeight,
              Text(
                "Landing the lead in the school musical is a dream come true for Jodi, until the pressure sends her confidence - and her relationship - into a tailspin.",
                style: TextStyle(
                  color: kGreyColor,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
