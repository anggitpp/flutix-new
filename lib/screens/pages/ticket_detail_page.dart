import 'package:flutix/screens/widgets/dash_separator.dart';
import 'package:flutix/screens/widgets/header_title.dart';
import 'package:flutix/screens/widgets/star_widget.dart';
import 'package:flutix/shared/theme.dart';
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
          SizedBox(
            height: 20,
          ),
          Container(
            width: phoneWidth - 2 * defaultMargin,
            height: 170,
            decoration: BoxDecoration(
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
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            decoration: BoxDecoration(
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
                  style: mediumText.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'Action - English',
                  style: greySmallText,
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    StarWidget(star: 7),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      '7/10',
                      style: currencySmallText,
                    )
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Cinema',
                      style: greyMediumText,
                    ),
                    Text(
                      'Paris Van Java',
                      style: mediumText,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Date & Time',
                      style: greyMediumText,
                    ),
                    Text(
                      'Sat 21, 12:20',
                      style: currencySmallText.copyWith(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Seat Number',
                      style: greyMediumText,
                    ),
                    Text(
                      'B3, B4',
                      style: currencySmallText.copyWith(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ID Order',
                      style: greyMediumText,
                    ),
                    Text(
                      '22081996',
                      style: currencySmallText.copyWith(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                DashSeparator(
                  height: 1,
                  color: greyColor,
                ),
                SizedBox(
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
                          style: greyMediumText,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          'Angga Risky',
                          style: mediumText,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Paid',
                          style: greyMediumText,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          NumberFormat.currency(
                                  locale: 'id',
                                  symbol: 'Rp. ',
                                  decimalDigits: 0)
                              .format(180409),
                          style: mediumText,
                        ),
                      ],
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
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
