import 'package:flutix/models/cinema.dart';
import 'package:flutix/models/movie.dart';
import '../../widgets/button_text.dart';
import 'package:flutix/screens/widgets/header_title.dart';
import 'package:flutix/widgets/star_widget.dart';
import '../../config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    DateTime now = DateTime.now();
    DateTime date = DateTime(
        now.year, now.month, int.parse(Get.arguments['date'].toString()));

    var formattedDate = DateFormat('EE dd', 'id').format(date);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            HeaderTitle(
              backFunction: () => Get.back(),
              title: 'Checkout\nMovie',
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
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
                        image: AssetImage('assets/movies/' + movie.image),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: AppTextStyle.largeText.copyWith(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        '${movie.genre} - ${movie.language}',
                        style: AppTextStyle.greySmallText,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          StarWidget(star: movie.star),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            movie.star.toString() + '/10',
                            style: AppTextStyle.currencySmallText,
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: phoneWidth - 2 * AppSizes.defaultMargin,
              height: 1,
              color: AppColors.lightGreyColor,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.defaultMargin),
              child: Column(
                children: [
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
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Cinema',
                        style: AppTextStyle.greyMediumText,
                      ),
                      Text(
                        cinema.name,
                        style: AppTextStyle.mediumText,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Date & Time',
                        style: AppTextStyle.greyMediumText,
                      ),
                      Text(
                        '$formattedDate, ${Get.arguments['time']}',
                        style: AppTextStyle.currencySmallText.copyWith(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Seat Number',
                        style: AppTextStyle.greyMediumText,
                      ),
                      Text(
                        Get.arguments['seat']
                            .toString()
                            .replaceAll('[', '')
                            .replaceAll(']', ''),
                        style: AppTextStyle.currencySmallText.copyWith(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Price',
                        style: AppTextStyle.greyMediumText,
                      ),
                      Text(
                        NumberFormat.currency(
                                    locale: 'id',
                                    symbol: 'Rp ',
                                    decimalDigits: 0)
                                .format(25000) +
                            ' x ' +
                            Get.arguments['seat'].length.toString(),
                        style: AppTextStyle.currencySmallText.copyWith(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Fee',
                        style: AppTextStyle.greyMediumText,
                      ),
                      Text(
                        NumberFormat.currency(
                                    locale: 'id',
                                    symbol: 'Rp ',
                                    decimalDigits: 0)
                                .format(2500) +
                            ' x ' +
                            Get.arguments['seat'].length.toString(),
                        style: AppTextStyle.currencySmallText.copyWith(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: AppTextStyle.greyMediumText,
                      ),
                      Text(
                        NumberFormat.currency(
                                locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                            .format(25000 * Get.arguments['seat'].length),
                        style: AppTextStyle.currencySmallText.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: phoneWidth,
                    height: 1,
                    color: AppColors.lightGreyColor,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your Wallet',
                        style: AppTextStyle.greyMediumText,
                      ),
                      Text(
                        NumberFormat.currency(
                                locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                            .format(480500500),
                        style: AppTextStyle.currencySmallText.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.greenColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  ButtonText(
                    color: AppColors.greenColor,
                    text: 'Checkout Now',
                    function: () => Get.offAllNamed('/success', arguments: {
                      'image': 'success_checkout.png',
                      'title': 'Happy Watching!',
                      'text1': 'You have successfully',
                      'text2': 'bought the ticket',
                      'buttonText': 'My Tickets',
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
