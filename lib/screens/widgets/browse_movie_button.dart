import 'package:flutter/material.dart';

import 'package:flutix/shared/theme.dart';

class BrowseMovieButton extends StatelessWidget {
  const BrowseMovieButton({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);

  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/icons/' + image,
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 4,
      ),
      Text(
        text,
        style: smallText,
      )
    ]);
  }
}
