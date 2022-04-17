import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../config/theme.dart';

class RegistrationPageController extends GetxController {
  var nameLabelColor = AppColors.greyColor.obs;
  var emailLabelColor = AppColors.greyColor.obs;
  var passwordLabelColor = AppColors.greyColor.obs;
  var confirmPasswordLabelColor = AppColors.greyColor.obs;

  var imagePath = '';
  File? image;

  var isCanSignUp = false.obs;
  var isLoadedImage = false.obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void changeFocusName(hasFocus) {
    if (hasFocus) {
      nameLabelColor.value = AppColors.yellowColor;
    } else {
      nameLabelColor.value = AppColors.greyColor;
    }
  }

  void uploadImage() {
    getImage().then((value) {
      isLoadedImage.value = true;
    });
  }

  void removeImage() {
    isLoadedImage.value = false;
    imagePath = '';
  }

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

  void changeFocusConfirmPassword(hasFocus) {
    if (hasFocus) {
      confirmPasswordLabelColor.value = AppColors.yellowColor;
    } else {
      confirmPasswordLabelColor.value = AppColors.greyColor;
    }
  }

  void checkNotEmpty() {
    if (emailController.text != '' &&
        passwordController.text != '' &&
        nameController.text != '' &&
        confirmPasswordController.text != '') {
      isCanSignUp.value = true;
    } else {
      isCanSignUp.value = false;
    }
  }

  Future getImage() async {
    var pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    image = File(pickedImage!.path); // won't have any error now
    imagePath = pickedImage.path;
  }
}
