import 'package:flutix/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController {
  var emailLabelColor = greyColor.obs;
  var passwordLabelColor = greyColor.obs;

  var isCanSignIn = false.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void changeFocusEmail(hasFocus) {
    if (hasFocus) {
      emailLabelColor.value = yellowColor;
    } else {
      emailLabelColor.value = greyColor;
    }
  }

  void changeFocusPassword(hasFocus) {
    if (hasFocus) {
      passwordLabelColor.value = yellowColor;
    } else {
      passwordLabelColor.value = greyColor;
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
