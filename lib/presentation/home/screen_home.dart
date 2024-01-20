import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/core/textstyles.dart';
import 'package:netflix/presentation/home/widgets/home_banner_side_button.dart';
import 'package:netflix/presentation/home/widgets/main_number_title_card.dart';
import 'package:netflix/presentation/home/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (context, index, _) =>
            NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            print(direction);
            //
            if (direction == ScrollDirection.reverse) {
              scrollNotifier.value = false;
            } else if (direction == ScrollDirection.forward) {
              scrollNotifier.value = true;
            }
            return true;
          },
          child: Stack(
            children: [
              ListView(
                children: const [
                  HomeBanner(),
                  MainTitleCard(title: 'Released in the past year'),
                  MainTitleCard(title: 'Trending Now'),
                  MainNumberTitleCard(),
                  MainTitleCard(title: 'Tense Dramas'),
                  MainTitleCard(title: 'South Indian Cinemas')
                ],
              ),
              scrollNotifier.value == true
                  ? AnimatedContainer(
                      duration: const Duration(milliseconds: 1000),
                      width: double.infinity,
                      height: 90,
                      color: Colors.black.withOpacity(0.3),
                      child: Column(children: [
                        Row(
                          children: [
                            Image.network(
                              "https://www.iconfinder.com/icons/4375011/download/png/512",
                              width: 50,
                              height: 50,
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.cast,
                              color: Colors.white,
                              size: 30,
                            ),
                            kWidth,
                            Container(
                              width: 30,
                              height: 30,
                              color: Colors.blue,
                            ),
                            kWidth
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'TV Shows',
                              style: homeBannerTopTextTextstyle,
                            ),
                            Text(
                              'Movies',
                              style: homeBannerTopTextTextstyle,
                            ),
                            Text(
                              'Categories',
                              style: homeBannerTopTextTextstyle,
                            )
                          ],
                        )
                      ]),
                    )
                  : kHeight
            ],
          ),
        ),
      ),
    );
  }
}

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 500,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(kMainImage), fit: BoxFit.cover)),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            color: Colors.black.withOpacity(0.3),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HomeBannerSideButton(
                  title: 'My List',
                  icon: Icons.add,
                ),
                PlayButton(),
                HomeBannerSideButton(icon: Icons.info, title: 'Info')
              ],
            ),
          ),
        )
      ],
    );
  }
}

class PlayButton extends StatelessWidget {
  const PlayButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: () {},
        style: ButtonStyle(
            alignment: Alignment.center,
            fixedSize: const MaterialStatePropertyAll(Size.fromHeight(40)),
            shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(borderRadius: kBorderRadiusCircular5)),
            backgroundColor: const MaterialStatePropertyAll(kWhiteColor)),
        icon: const Center(
          child: Icon(
            Icons.play_arrow,
            color: kBlackColor,
          ),
        ),
        label: const Text(
          'Play',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: kBlackColor),
        ));
  }
}
