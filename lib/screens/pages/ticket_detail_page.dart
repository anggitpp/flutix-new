import 'package:flutix/screens/widgets/dash_separator.dart';
import 'package:flutix/widgets/header_title.dart';
import 'package:flutix/widgets/star_widget.dart';
import '../../config/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:supercharged/supercharged.dart';

class TicketDetailPage extends StatelessWidget {
  const TicketDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var phoneWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: 'F6F7F9'.toColor(),
      body: SafeArea(
          child: Column(
        children: [
          HeaderTitle(
            backFunction: Get.back,
            title: 'Ticket Details',
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: phoneWidth - 2 * AppSizes.defaultMargin,
            height: 170,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/movies/avengers.jpg'),
              ),
            ),
          ),
          Container(
            width: phoneWidth,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            margin:
                const EdgeInsets.symmetric(horizontal: AppSizes.defaultMargin),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Avengers: Infinity Wars',
                  style: AppTextStyle.mediumText.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  'Action - English',
                  style: AppTextStyle.greySmallText,
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    const StarWidget(star: 7),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      '7/10',
                      style: AppTextStyle.currencySmallText,
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Cinema',
                      style: AppTextStyle.greyMediumText,
                    ),
                    Text(
                      'Paris Van Java',
                      style: AppTextStyle.mediumText,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Date & Time',
                      style: AppTextStyle.greyMediumText,
                    ),
                    Text(
                      'Sat 21, 12:20',
                      style: AppTextStyle.currencySmallText.copyWith(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Seat Number',
                      style: AppTextStyle.greyMediumText,
                    ),
                    Text(
                      'B3, B4',
                      style: AppTextStyle.currencySmallText.copyWith(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ID Order',
                      style: AppTextStyle.greyMediumText,
                    ),
                    Text(
                      '22081996',
                      style: AppTextStyle.currencySmallText.copyWith(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                DashSeparator(
                  height: 1,
                  color: AppColors.greyColor,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name',
                          style: AppTextStyle.greyMediumText,
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          'Angga Risky',
                          style: AppTextStyle.mediumText,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Paid',
                          style: AppTextStyle.greyMediumText,
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          NumberFormat.currency(
                                  locale: 'id',
                                  symbol: 'Rp. ',
                                  decimalDigits: 0)
                              .format(180409),
                          style: AppTextStyle.mediumText,
                        ),
                      ],
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/qr.png'))),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
