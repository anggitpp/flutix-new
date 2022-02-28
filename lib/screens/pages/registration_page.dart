import 'package:flutix/controllers/registration_page_controller.dart';
import 'package:flutix/screens/widgets/header_title.dart';
import 'package:flutix/screens/widgets/textfield.dart';
import 'package:flutix/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RegistrationPageController>();
    return Scaffold(
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
                        child: controller.isLoadedImage.value
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.file(
                                  controller.image!,
                                  width: 150,
                                  height: 150,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Container(
                                width: 90,
                                height: 90,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage('assets/nophoto.png'))),
                              ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: InkWell(
                          onTap: controller.isLoadedImage.value
                              ? controller.removeImage
                              : controller.uploadImage,
                          child: Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: controller.isLoadedImage.value
                                    ? const AssetImage(
                                        'assets/icons/remove_photo.png')
                                    : const AssetImage(
                                        'assets/icons/add_photo.png'),
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
              Obx(
                () => Container(
                  margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: Column(
                    children: [
                      Focus(
                        onFocusChange: (value) =>
                            controller.changeFocusName(value),
                        child: CreateTextField(
                          controller: controller.nameController,
                          labelColor: controller.nameLabelColor.value,
                          checkFunction: controller.checkNotEmpty,
                          label: 'Full Name',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
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
                        height: 20,
                      ),
                      Focus(
                        onFocusChange: (value) =>
                            controller.changeFocusPassword(value),
                        child: CreateTextField(
                          controller: controller.passwordController,
                          labelColor: controller.passwordLabelColor.value,
                          checkFunction: controller.checkNotEmpty,
                          label: 'Password',
                          obsecureText: true,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Focus(
                        onFocusChange: (value) =>
                            controller.changeFocusConfirmPassword(value),
                        child: CreateTextField(
                          controller: controller.confirmPasswordController,
                          labelColor:
                              controller.confirmPasswordLabelColor.value,
                          checkFunction: controller.checkNotEmpty,
                          label: 'Confirm Password',
                          obsecureText: true,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () => controller.isCanSignUp.value
                            ? Get.toNamed('/genre')
                            : () {},
                        child: Center(
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: controller.isCanSignUp.value
                                    ? purpleColor
                                    : lightGreyColor),
                            child: Icon(
                              Icons.arrow_forward,
                              color: controller.isCanSignUp.value
                                  ? Colors.white
                                  : darkGreyColor,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
