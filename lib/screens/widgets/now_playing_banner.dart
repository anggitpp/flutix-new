import 'package:flutix/model/movie.dart';
import 'package:flutter/material.dart';

import 'package:flutix/shared/theme.dart';
import 'package:get/get.dart';

class NowPlayingBanner extends StatelessWidget {
  const NowPlayingBanner({
    Key? key,
    required this.index,
    required this.movie,
  }) : super(key: key);

  final int index;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed('/movieDetail', arguments: {
        'movie': movie,
      }),
      child: Container(
        margin: EdgeInsets.only(
          left: index == 0 ? defaultMargin : 16,
          right: index < 4 ? 0 : defaultMargin,
        ),
        width: 210,
        height: 140,
        child: Stack(
          children: [
            Container(
              width: 210,
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/movies/' + movie.image),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                width: 210,
                height: 55,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5.0,
                        spreadRadius: 0,
                        color: Colors.black.withOpacity(0.4)),
                  ],
                ),
                padding: const EdgeInsets.only(left: 13, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      movie.title,
                      style: smallText.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        stars(movie.star),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          movie.star.toString() + '/10',
                          style: currencySmallText.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget stars(star) {
    return Row(
      children: [
        for (var i = 1; i <= 5; i++)
          Icon(
            Icons.star,
            color:
                (star / 2).toDouble().round() >= i ? yellowColor : Colors.white,
            size: 20,
          ),
      ],
    );
  }
}
