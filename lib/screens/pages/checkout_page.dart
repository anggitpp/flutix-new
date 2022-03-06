import 'package:flutix/screens/widgets/header_title.dart';
import 'package:flutix/screens/widgets/star_widget.dart';
import 'package:flutix/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var phoneWidth = MediaQuery.of(context).size.width;
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
                            image: AssetImage('assets/movies/avengers.jpg'))),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Avengers: Infinity Wars',
                        style: largeText.copyWith(
                          fontSize: 18,
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
                            width: 6,
                          ),
                          Text(
                            '7/10',
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
                        'Paris Van Java',
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
                        'Sat 21, 12:20',
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
                        'B3, B4',
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
                                .format(12500000) +
                            ' x 2',
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
                                .format(290000) +
                            ' x 2',
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
                            .format(25106000),
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
                  Container(
                    width: 250,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Checkout Now',
                        style: mediumText.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: greenColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
