import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/theme.dart';

class LoginPageController extends GetxController {
  var emailLabelColor = AppColors.greyColor.obs;
  var passwordLabelColor = AppColors.greyColor.obs;

  var isCanSignIn = false.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void changeFocusEmail(hasFocus) {
    if (hasFocus) {
      emailLabelColor.value = AppColors.yellowColor;
    } else {
      emailLabelColor.value = AppColors.greyColor;
    }
  }

  void changeFocusPassword(hasFocus) {
    if (hasFocus) {
      passwordLabelColor.value = AppColors.yellowColor;
    } else {
      passwordLabelColor.value = AppColors.greyColor;
    }
  }

  void checkNotEmpty() {
    if (emailController.text != '' && passwordController.text != '') {
      isCanSignIn.value = true;
    } else {
      isCanSignIn.value = false;
    }
  }
}
