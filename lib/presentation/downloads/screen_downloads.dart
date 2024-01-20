import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});
  final _widgetList = [const _SmartDownloads(), Section2(), const Section3()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            appBartitle: 'Downloads',
          )),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemBuilder: (context, index) => _widgetList[index],
        itemCount: _widgetList.length,
        separatorBuilder: (context, index) => const SizedBox(
          height: 40,
        ),
      ),
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            child: MaterialButton(
              color: kButtonColorBlue,
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Set up',
                  style: TextStyle(
                      color: kWhiteColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          kHeight,
          kHeight,
          MaterialButton(
            color: kButtonColorWhite,
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'See what you can download',
                style: TextStyle(
                    color: kBlackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});
  final List imageList = [
    "https://media.themoviedb.org/t/p/w300_and_h450_bestv2/jE5o7y9K6pZtWNNMEw3IdpHuncR.jpg",
    "https://media.themoviedb.org/t/p/w220_and_h330_face/2e853FDVSIso600RqAMunPxiZjq.jpg",
    "https://media.themoviedb.org/t/p/w220_and_h330_face/8xV47NDrjdZDpkVcCFqkdHa3T0C.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Introducing Downloads For You',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kWhiteColor, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        kHeight,
        const Text(
          "We will download a personalised selection of\nmovies and shows for you, so there's\nalways somathing to watch on your\ndevice.",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        SizedBox(
          width: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[800],
                radius: size.width * 0.35,
              ),
              DownloadsImageWidget(
                imageAddress: imageList[0],
                angleOfRotation: 20,
                margin: const EdgeInsets.only(left: 180, bottom: 50, top: 50),
                size: Size(size.width * 0.3, size.width * 0.48),
              ),
              DownloadsImageWidget(
                imageAddress: imageList[1],
                angleOfRotation: -20,
                margin: const EdgeInsets.only(right: 180, bottom: 50, top: 50),
                size: Size(size.width * 0.3, size.width * 0.48),
              ),
              DownloadsImageWidget(
                imageAddress: imageList[2],
                angleOfRotation: 0,
                margin: const EdgeInsets.only(top: 30),
                size: Size(size.width * 0.35, size.width * 0.55),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.settings,
          color: kWhiteColor,
        ),
        kWidth,
        Text('Smart Downloads')
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    super.key,
    required this.imageAddress,
    required this.angleOfRotation,
    required this.margin,
    required this.size,
  });

  final String imageAddress;
  final double angleOfRotation;
  final EdgeInsets margin;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angleOfRotation * pi / 180,
      child: Container(
        margin: margin,
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(imageAddress)),
          borderRadius: kBorderRadiusCircular10,
        ),
        width: size.width,
        height: size.height,
      ),
    );
  }
}
