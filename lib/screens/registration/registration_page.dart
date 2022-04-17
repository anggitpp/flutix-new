import 'package:flutix/screens/widgets/header_title.dart';
import 'package:flutix/screens/widgets/textfield.dart';
import 'package:flutix/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/theme.dart';
import '../../widgets/button_next.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final controller = Get.find<RegistrationPageController>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderTitle(
                  title: 'Create New\nYour Account', backFunction: Get.back),
              const SizedBox(
                height: 22,
              ),
              Obx(
                () => SizedBox(
                  width: 100,
                  height: 100,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child:
                            // controller.isLoadedImage.value
                            //     ? ClipRRect(
                            //         borderRadius: BorderRadius.circular(100),
                            //         child: Image.file(
                            //           controller.image!,
                            //           width: 150,
                            //           height: 150,
                            //           fit: BoxFit.cover,
                            //         ),
                            //       )
                            // :
                            Container(
                          width: 90,
                          height: 90,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/nophoto.png'))),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: InkWell(
                          // onTap: controller.isLoadedImage.value
                          //     ? controller.removeImage
                          //     : controller.uploadImage,
                          child: Container(
                            width: 28,
                            height: 28,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      // controller.isLoadedImage.value
                                      // ?
                                      AssetImage(
                                          'assets/icons/remove_photo.png')
                                  // : const AssetImage(
                                  //     'assets/icons/add_photo.png'),
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: AppSizes.defaultMargin),
                child: Column(
                  children: [
                    Focus(
                      // onFocusChange: (value) =>
                      //     controller.changeFocusName(value),
                      child: CreateTextField(
                        controller: TextEditingController(),

                        // controller: controller.nameController,
                        // labelColor: controller.nameLabelColor.value,
                        // checkFunction: controller.checkNotEmpty,
                        label: 'Full Name',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Focus(
                      // onFocusChange: (value) =>
                      //     controller.changeFocusEmail(value),
                      child: CreateTextField(
                        // controller: controller.emailController,
                        controller: TextEditingController(),

                        // labelColor: controller.emailLabelColor.value,
                        // checkFunction: controller.checkNotEmpty,
                        label: 'Email Address',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Focus(
                      // onFocusChange: (value) =>
                      //     controller.changeFocusPassword(value),
                      child: CreateTextField(
                        controller: TextEditingController(),

                        // controller: controller.passwordController,
                        // labelColor: controller.passwordLabelColor.value,
                        // checkFunction: controller.checkNotEmpty,
                        label: 'Password',
                        obsecureText: true,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Focus(
                      // onFocusChange: (value) =>
                      //     controller.changeFocusConfirmPassword(value),
                      child: CreateTextField(
                        controller: TextEditingController(),
                        // controller: controller.confirmPasswordController,

                        // labelColor:
                        //     controller.confirmPasswordLabelColor.value,
                        // checkFunction: controller.checkNotEmpty,
                        label: 'Confirm Password',
                        obsecureText: true,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      // onTap: () => controller.isCanSignUp.value
                      //     ? Get.toNamed('/genre')
                      //     : () {},
                      child: ButtonNext(
                          arrowColor:
                              // controller.isCanSignUp.value
                              // ? Colors.white
                              // :
                              AppColors.darkGreyColor,
                          backgroundColor:
                              // controller.isCanSignUp.value
                              // ?
                              AppColors.purpleColor
                          // : AppColors.color: AppColors.lightGreyColor,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
