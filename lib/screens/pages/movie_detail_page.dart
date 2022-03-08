import 'package:flutix/screens/widgets/button_text.dart';
import 'package:flutix/screens/widgets/star_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutix/model/cast.dart';
import 'package:flutix/model/movie.dart';
import 'package:flutix/shared/theme.dart';
import 'package:get/get.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final phoneWidth = MediaQuery.of(context).size.width;
    final Movie movie = Get.arguments['movie'];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: ShaderMask(
                  shaderCallback: (rect) {
                    return LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Colors.black.withOpacity(1),
                        Colors.black.withOpacity(1),
                        Colors.black.withOpacity(1),
                        Colors.black.withOpacity(0.0),
                      ],
                    ).createShader(
                        Rect.fromLTRB(0, 0, rect.width, rect.height));
                  },
                  blendMode: BlendMode.dstIn,
                  child: Container(
                    width: phoneWidth,
                    height: 270,
                    padding: EdgeInsets.only(left: defaultMargin, top: 16),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/movies/' + movie.image))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () => Get.back(),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 270),
                padding: const EdgeInsets.only(top: 16),
                width: phoneWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          movie.title,
                          style: largeText.copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          '${movie.genre} - ${movie.language}',
                          style: greySmallText,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            StarWidget(star: movie.star),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              movie.star.toString() + '/10',
                              style:
                                  currencySmallText.copyWith(color: greyColor),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: Text(
                        'Cast & Crew',
                        style: smallText.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      height: 110,
                      width: double.infinity,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: movie.casts.length,
                        itemBuilder: (context, index) {
                          var data = movie.casts[index];
                          return Container(
                            width: 70,
                            height: 110,
                            margin: EdgeInsets.only(
                                left: index == 0 ? defaultMargin : 12,
                                right: index == dummyCast.length - 1
                                    ? defaultMargin
                                    : 0),
                            child: Column(
                              children: [
                                Container(
                                  width: 110,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/movies/' + data.imageURL),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                SizedBox(
                                  width: 70,
                                  height: 24,
                                  child: Text(
                                    data.name,
                                    style: smallText.copyWith(
                                      fontSize: 10,
                                    ),
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Storyline',
                            style: smallText.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            movie.storyline,
                            style: greySmallText,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: ButtonText(
                              color: purpleColor,
                              text: 'Continue to Book',
                              function: () =>
                                  Get.toNamed('/selectCinema', arguments: {
                                'movie': Get.arguments['movie'],
                              }),
                            ),
                          ),
                          const SizedBox(
                            height: 45,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
