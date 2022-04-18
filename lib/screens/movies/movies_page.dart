import 'package:flutix/models/movie.dart';
import 'package:flutix/models/promo.dart';
import 'package:flutix/screens/movies/widgets/browse_movie_button.dart';
import 'package:flutix/screens/movies/widgets/coming_soon_banner.dart';
import 'package:flutix/screens/widgets/now_playing_banner.dart';
import 'package:flutix/screens/movies/widgets/promo_card.dart';
import '../../config/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final phoneWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: phoneWidth,
          height: 110,
          decoration: BoxDecoration(
            color: AppColors.darkPurpleColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 24, bottom: 30),
            child: GestureDetector(
              onTap: () => Get.toNamed('/profile'),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/nophoto.png'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Angga Risky',
                        style: AppTextStyle.mediumText.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'IDR 22.523',
                        style: AppTextStyle.currencySmallText
                            .copyWith(color: AppColors.yellowColor),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: AppSizes.defaultMargin),
              child: Text(
                'Now Playing',
                style: AppTextStyle.mediumText.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              height: 140,
              width: double.infinity,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: dummyMovies.length,
                itemBuilder: (context, index) {
                  return NowPlayingBanner(
                    index: index,
                    movie: dummyMovies[index],
                  );
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.only(left: AppSizes.defaultMargin),
              child: Text(
                'Browse Movie',
                style: AppTextStyle.mediumText
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              width: phoneWidth - 2 * AppSizes.defaultMargin,
              margin: const EdgeInsets.symmetric(
                  horizontal: AppSizes.defaultMargin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  BrowseMovieButton(text: 'Action', image: 'action.png'),
                  BrowseMovieButton(text: 'War', image: 'war.png'),
                  BrowseMovieButton(text: 'Drama', image: 'drama.png'),
                  BrowseMovieButton(text: 'Music', image: 'music.png'),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: AppSizes.defaultMargin),
              child: Text(
                'Coming Soon',
                style: AppTextStyle.mediumText
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              height: 140,
              width: double.infinity,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: dummyMovies.length,
                itemBuilder: (context, index) {
                  return ComingSoonBanner(
                    index: index,
                    movie: dummyMovies[index],
                  );
                },
              ),
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
        SizedBox(
          width: phoneWidth,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: dummyPromos.length,
            itemBuilder: (context, index) {
              return PromoCard(
                promo: dummyPromos[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
