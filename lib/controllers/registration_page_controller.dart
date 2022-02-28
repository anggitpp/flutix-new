import 'dart:io';
import 'package:flutix/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RegistrationPageController extends GetxController {
  var nameLabelColor = greyColor.obs;
  var emailLabelColor = greyColor.obs;
  var passwordLabelColor = greyColor.obs;
  var confirmPasswordLabelColor = greyColor.obs;

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
      nameLabelColor.value = yellowColor;
    } else {
      nameLabelColor.value = greyColor;
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

  void changeFocusConfirmPassword(hasFocus) {
    if (hasFocus) {
      confirmPasswordLabelColor.value = yellowColor;
    } else {
      confirmPasswordLabelColor.value = greyColor;
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
