import 'package:flutix/models/promo.dart';
import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

import '../../config/theme.dart';

class PromoCard extends StatelessWidget {
  const PromoCard({
    Key? key,
    required this.promo,
  }) : super(key: key);

  final Promo promo;

  @override
  Widget build(BuildContext context) {
    final phoneWidth = MediaQuery.of(context).size.width;

    return Container(
      width: phoneWidth - 2 * AppSizes.defaultMargin,
      margin: const EdgeInsets.only(
          left: AppSizes.defaultMargin,
          right: AppSizes.defaultMargin,
          bottom: 16),
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'assets/background-promo.png',
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                promo.title,
                style: AppTextStyle.smallText.copyWith(color: Colors.white),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                promo.subtitle,
                style: AppTextStyle.smallText.copyWith(
                  color: 'A99BE3'.toColor(),
                  fontSize: 11,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'OFF ',
                style: AppTextStyle.smallText
                    .copyWith(fontSize: 18, color: AppColors.yellowColor),
              ),
              Text(
                promo.percent.toString() + '%',
                style: AppTextStyle.currencySmallText.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.yellowColor,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
