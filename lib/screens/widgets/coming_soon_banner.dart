import 'package:flutter/material.dart';

import 'package:flutix/model/movie.dart';
import 'package:flutix/shared/theme.dart';

class ComingSoonBanner extends StatelessWidget {
  const ComingSoonBanner({
    Key? key,
    required this.index,
    required this.movie,
  }) : super(key: key);

  final int index;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: index == 0 ? defaultMargin : 16,
        right: index == 5 ? defaultMargin : 0,
      ),
      width: 100,
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/movies/' + movie.image),
        ),
      ),
    );
  }
}
