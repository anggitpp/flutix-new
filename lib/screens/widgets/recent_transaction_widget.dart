import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:supercharged/supercharged.dart';

import '../../config/theme.dart';

class RecentTransactionWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final int amount;
  final String imageMovie;
  const RecentTransactionWidget({
    Key? key,
    this.title = 'Top Up Wallet',
    required this.subtitle,
    required this.amount,
    this.imageMovie = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var phoneWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      width: phoneWidth - 2 * AppSizes.defaultMargin,
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
                image: imageMovie == ''
                    ? const AssetImage('assets/topup.png')
                    : AssetImage('assets/movies/' + imageMovie),
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
                style: AppTextStyle.largeText.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                NumberFormat.currency(
                        locale: 'id', symbol: 'Rp. ', decimalDigits: 0)
                    .format(amount),
                style: AppTextStyle.currencySmallText.copyWith(
                  color: imageMovie == ''
                      ? AppColors.greenColor
                      : 'FF5C83'.toColor(),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                subtitle,
                style: AppTextStyle.greySmallText,
              ),
            ],
          )
        ],
      ),
    );
  }
}
