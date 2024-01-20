import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class HomeMainCard extends StatelessWidget {
  const HomeMainCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 115,
      height: 200,
      decoration: BoxDecoration(
          borderRadius: kBorderRadiusCircular10,
          image: const DecorationImage(
              image: NetworkImage(
                  "https://media.themoviedb.org/t/p/w220_and_h330_face/8xV47NDrjdZDpkVcCFqkdHa3T0C.jpg"),
              fit: BoxFit.cover)),
    );
  }
}
