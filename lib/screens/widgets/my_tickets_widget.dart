import 'package:flutix/shared/theme.dart';
import 'package:flutter/material.dart';

class MyTicketsWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String language;
  final String genre;
  final String imageMovie;
  const MyTicketsWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.language,
    required this.genre,
    required this.imageMovie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var phoneWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: phoneWidth - 2 * defaultMargin,
      height: 90,
      child: Row(
        children: [
          Container(
            width: 70,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/movies/' + imageMovie),
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: largeText.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '$genre - $language',
                style: greySmallText,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                subtitle,
                style: greySmallText,
              ),
            ],
          )
        ],
      ),
    );
  }
}
