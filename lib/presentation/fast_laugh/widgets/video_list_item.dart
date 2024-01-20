import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/textstyles.dart';

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        color: Colors.accents[index % Colors.accents.length],
      ),
      Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Left side of row
              CircleAvatar(
                backgroundColor: Colors.black.withOpacity(0.5),
                radius: 25,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.volume_off,
                      color: Colors.white,
                      size: 30,
                    )),
              ),
              //Right side
              const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          "https://media.themoviedb.org/t/p/w220_and_h330_face/8xV47NDrjdZDpkVcCFqkdHa3T0C.jpg"),
                    ),
                  ),
                  VideoActionsWidget(icon: Icons.emoji_emotions, title: 'LOL'),
                  VideoActionsWidget(icon: Icons.add, title: 'My List'),
                  VideoActionsWidget(icon: Icons.share, title: 'Share'),
                  VideoActionsWidget(
                      icon: Icons.play_circle_fill_sharp, title: 'Play')
                ],
              )
            ],
          ),
        ),
      )
    ]);
  }
}

class VideoActionsWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionsWidget(
      {super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: kWhiteColor,
            size: 30,
          ),
          Text(
            title,
            style: videoActionsWidgetTextstyle,
          )
        ],
      ),
    );
  }
}
