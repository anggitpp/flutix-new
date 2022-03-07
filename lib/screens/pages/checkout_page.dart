import 'package:flutix/model/cinema.dart';
import 'package:flutix/model/movie.dart';
import 'package:flutix/screens/widgets/button_text.dart';
import 'package:flutix/screens/widgets/header_title.dart';
import 'package:flutix/screens/widgets/star_widget.dart';
import 'package:flutix/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();

    var phoneWidth = MediaQuery.of(context).size.width;
    Movie movie = Get.arguments['movie'];
    Cinema cinema = Get.arguments['cinema'];
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(
        now.year, now.month, int.parse(Get.arguments['date'].toString()));

    var formattedDate = DateFormat('EE dd', 'id').format(date);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HeaderTitle(
              backFunction: () => Get.back(),
              title: 'Checkout\nMovie',
            ),
            SizedBox(
              height: 20,
            ),
            Container(
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
                        image: AssetImage('assets/movies/' + movie.image),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: largeText.copyWith(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        '${movie.genre} - ${movie.language}',
                        style: greySmallText,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          StarWidget(star: movie.star),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            movie.star.toString() + '/10',
                            style: currencySmallText,
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: phoneWidth - 2 * defaultMargin,
              height: 1,
              color: lightGreyColor,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Column(
                children: [
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
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Cinema',
                        style: greyMediumText,
                      ),
                      Text(
                        cinema.name,
                        style: mediumText,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Date & Time',
                        style: greyMediumText,
                      ),
                      Text(
                        '$formattedDate, ${Get.arguments['time']}',
                        style: currencySmallText.copyWith(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Seat Number',
                        style: greyMediumText,
                      ),
                      Text(
                        Get.arguments['seat']
                            .toString()
                            .replaceAll('[', '')
                            .replaceAll(']', ''),
                        style: currencySmallText.copyWith(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Price',
                        style: greyMediumText,
                      ),
                      Text(
                        NumberFormat.currency(
                                    locale: 'id',
                                    symbol: 'Rp ',
                                    decimalDigits: 0)
                                .format(25000) +
                            ' x ' +
                            Get.arguments['seat'].length.toString(),
                        style: currencySmallText.copyWith(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Fee',
                        style: greyMediumText,
                      ),
                      Text(
                        NumberFormat.currency(
                                    locale: 'id',
                                    symbol: 'Rp ',
                                    decimalDigits: 0)
                                .format(2500) +
                            ' x ' +
                            Get.arguments['seat'].length.toString(),
                        style: currencySmallText.copyWith(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: greyMediumText,
                      ),
                      Text(
                        NumberFormat.currency(
                                locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                            .format(25000 * Get.arguments['seat'].length),
                        style: currencySmallText.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: phoneWidth,
                    height: 1,
                    color: lightGreyColor,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your Wallet',
                        style: greyMediumText,
                      ),
                      Text(
                        NumberFormat.currency(
                                locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                            .format(480500500),
                        style: currencySmallText.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: greenColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 36,
                  ),
                  ButtonText(
                      color: greenColor,
                      text: 'Checkout Now',
                      function: () => Get.toNamed('/success'))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
