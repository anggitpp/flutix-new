import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../config/theme.dart';
import '../../widgets/button_text.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            style: AppTextStyle.largeText.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Watch a new movie much\neasier than any before',
            style: AppTextStyle.greyMediumText,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 70,
          ),
          ButtonText(
            color: AppColors.purpleColor,
            text: 'Get started',
            function: () => Get.toNamed('/home'),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account? ',
                style: AppTextStyle.greySmallText,
              ),
              InkWell(
                onTap: () => Get.toNamed('/login'),
                child: Text(
                  'Sign In',
                  style: AppTextStyle.smallText
                      .copyWith(color: AppColors.purpleColor),
                ),
              )
            ],
          ),
        ],
      )),
    );
  }
}
