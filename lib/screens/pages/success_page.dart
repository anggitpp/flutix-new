import 'package:flutix/screens/widgets/button_text.dart';
import 'package:flutix/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/' + Get.arguments['image']),
                ),
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Text(
              Get.arguments['title'],
              style: largeText,
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              Get.arguments['text1'],
              style: greyMediumText,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              Get.arguments['text2'],
              style: greyMediumText,
            ),
            SizedBox(
              height: 70,
            ),
            ButtonText(
              color: purpleColor,
              text: Get.arguments['buttonText'],
              function: () {},
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Discover new movie? ',
                  style: greySmallText,
                ),
                InkWell(
                  onTap: () => Get.offAllNamed('/home'),
                  child: Text(
                    'Back to Home',
                    style: smallText.copyWith(
                      color: purpleColor,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
