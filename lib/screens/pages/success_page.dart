import 'package:flutix/controllers/home_page_controller.dart';
import '../../widgets/button_text.dart';
import '../../config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomePageController>();
    return WillPopScope(
      onWillPop: () async {
        Get.toNamed('/home');
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 0,
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness:
                Brightness.dark, // For Android (dark icons)
            statusBarBrightness: Brightness.light, // For iOS (dark icons)
          ),
        ),
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
              const SizedBox(
                height: 70,
              ),
              Text(
                Get.arguments['title'],
                style: AppTextStyle.largeText,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                Get.arguments['text1'],
                style: AppTextStyle.greyMediumText,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                Get.arguments['text2'],
                style: AppTextStyle.greyMediumText,
              ),
              const SizedBox(
                height: 70,
              ),
              ButtonText(
                color: AppColors.purpleColor,
                text: Get.arguments['buttonText'],
                function: () {
                  Get.toNamed('/home');
                  controller.changePage('tickets');
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Discover new movie? ',
                    style: AppTextStyle.greySmallText,
                  ),
                  InkWell(
                    onTap: () => Get.offAllNamed('/home'),
                    child: Text(
                      'Back to Home',
                      style: AppTextStyle.smallText.copyWith(
                        color: AppColors.purpleColor,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
