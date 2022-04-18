import 'package:flutix/controllers/edit_profile_page_controller.dart';
import '../../widgets/button_text.dart';
import 'package:flutix/widgets/header_title.dart';
import 'package:flutix/screens/widgets/textfield.dart';
import '../../config/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<EditProfilePageController>();
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            HeaderTitle(
              backFunction: Get.back,
              title: 'Edit Your\nProfile',
            ),
            const SizedBox(
              height: 25,
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
                                      image: AssetImage('assets/nophoto.png'))),
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
                margin: const EdgeInsets.symmetric(
                    horizontal: AppSizes.defaultMargin),
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
                        labelColor: controller.confirmPasswordLabelColor.value,
                        checkFunction: controller.checkNotEmpty,
                        label: 'Confirm Password',
                        obsecureText: true,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ButtonText(
                      color: controller.isCanSignUp.value
                          ? AppColors.greenColor
                          : AppColors.greyColor,
                      text: 'Update My Profile',
                      function: () {},
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
