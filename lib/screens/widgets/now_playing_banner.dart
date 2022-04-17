import 'package:flutix/models/movie.dart';
import 'package:flutix/screens/widgets/star_widget.dart';
import 'package:flutter/material.dart';

import '../../config/theme.dart';
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
          left: index == 0 ? AppSizes.defaultMargin : 16,
          right: index < 4 ? 0 : AppSizes.defaultMargin,
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
                      style: AppTextStyle.smallText.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        StarWidget(
                          star: movie.star,
                          isBanner: true,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          movie.star.toString() + '/10',
                          style: AppTextStyle.currencySmallText.copyWith(
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
}
