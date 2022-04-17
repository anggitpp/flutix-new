import 'package:flutix/controllers/login_page_controller.dart';
import 'package:flutix/screens/widgets/textfield.dart';
import '../../config/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/button_next.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginPageController>();

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.defaultMargin, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/logo.png'))),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Text(
                    'Welcome Back,\nExplorer!',
                    style: AppTextStyle.largeText.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Obx(
                    () => Column(
                      children: [
                        Focus(
                          onFocusChange: (value) =>
                              controller.changeFocusEmail(value),
                          child: CreateTextField(
                            controller: controller.emailController,
                            labelColor: controller.emailLabelColor.value,
                            checkFunction: controller.checkNotEmpty,
                            label: 'Email Address',
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Focus(
                          onFocusChange: (value) =>
                              controller.changeFocusPassword(value),
                          child: CreateTextField(
                            controller: controller.passwordController,
                            labelColor: controller.passwordLabelColor.value,
                            checkFunction: controller.checkNotEmpty,
                            obsecureText: true,
                            label: 'Password',
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: ButtonNext(
                            arrowColor: controller.isCanSignIn.value
                                ? Colors.white
                                : AppColors.darkGreyColor,
                            backgroundColor: controller.isCanSignIn.value
                                ? AppColors.purpleColor
                                : AppColors.lightGreyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Start fresh now?',
                          style: AppTextStyle.greySmallText
                              .copyWith(color: AppColors.greyColor),
                        ),
                        InkWell(
                          onTap: (() => Get.toNamed('/registration')),
                          child: Text(
                            ' Sign Up',
                            style: AppTextStyle.smallText.copyWith(
                                color: AppColors.purpleColor,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
