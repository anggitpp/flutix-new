import 'package:flutix/controllers/login_page_controller.dart';
import 'package:flutix/screens/widgets/textfield.dart';
import 'package:flutix/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              padding:
                  EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 30),
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
                    style: largeText.copyWith(
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
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: controller.isCanSignIn.value
                                    ? purpleColor
                                    : lightGreyColor),
                            child: Icon(
                              Icons.arrow_forward,
                              color: controller.isCanSignIn.value
                                  ? Colors.white
                                  : darkGreyColor,
                              size: 30,
                            ),
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
                          style: greySmallText.copyWith(color: greyColor),
                        ),
                        InkWell(
                          onTap: (() => Get.toNamed('/registration')),
                          child: Text(
                            ' Sign Up',
                            style: smallText.copyWith(
                                color: purpleColor,
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
