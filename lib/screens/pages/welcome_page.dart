import 'package:flutix/screens/widgets/button_text.dart';
import 'package:flutix/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 130,
            height: 136,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/logo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          Text(
            'New Experience',
            style: largeText.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Watch a new movie much\neasier than any before',
            style: greyMediumText,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 70,
          ),
          ButtonText(
            color: purpleColor,
            text: 'Get started',
            function: () => Get.toNamed('/success', arguments: {
              'image': 'success_checkout.png',
              'title': 'Happy Watching!',
              'text1': 'You have successfully',
              'text2': 'bought the ticket',
              'buttonText': 'My Tickets',
            }),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account? ',
                style: greySmallText,
              ),
              InkWell(
                onTap: () => Get.toNamed('/login'),
                child: Text(
                  'Sign In',
                  style: smallText.copyWith(color: purpleColor),
                ),
              )
            ],
          ),
        ],
      )),
    );
  }
}
