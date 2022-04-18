import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutix/config/theme.dart';
import 'package:flutix/models/custom_error.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(RegistrationState.initial());

  File? image;

  void checkValid(
      String name, String email, String password, String confirmPassword) {
    if (name.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty &&
        confirmPassword.isNotEmpty) {
      emit(state.copyWith(isCanSignUp: true));
    } else {
      emit(state.copyWith(isCanSignUp: false));
    }
  }

  void changeFocusName({bool hasFocus = false, bool isError = false}) {
    if (hasFocus) {
      emit(state.copyWith(nameLabelColor: AppColors.yellowColor));
    } else {
      emit(state.copyWith(nameLabelColor: AppColors.greyColor));
    }

    if (isError) emit(state.copyWith(nameLabelColor: Colors.red));
  }

  void changeFocusEmail({bool hasFocus = false, bool isError = false}) {
    if (hasFocus) {
      emit(state.copyWith(emailLabelColor: AppColors.yellowColor));
    } else {
      emit(state.copyWith(emailLabelColor: AppColors.greyColor));
    }

    if (isError) emit(state.copyWith(emailLabelColor: Colors.red));
  }

  void changeFocusPassword({bool hasFocus = false, bool isError = false}) {
    if (hasFocus) {
      emit(state.copyWith(passwordLabelColor: AppColors.yellowColor));
    } else if (isError) {
      emit(state.copyWith(passwordLabelColor: Colors.red));
    } else {
      emit(state.copyWith(passwordLabelColor: AppColors.greyColor));
    }
  }

  void changeFocusConfirmPassword(
      {bool hasFocus = false, bool isError = false}) {
    if (hasFocus) {
      emit(state.copyWith(confirmPasswordLabelColor: AppColors.yellowColor));
    } else if (isError) {
      emit(state.copyWith(confirmPasswordLabelColor: Colors.red));
    } else {
      emit(state.copyWith(confirmPasswordLabelColor: AppColors.greyColor));
    }
  }

  void uploadImage() {
    getImage().then((value) {
      emit(state.copyWith(isLoadedImage: true));
    });
  }

  void removeImage() {
    emit(state.copyWith(isLoadedImage: false, imagePath: ''));
  }

  Future getImage() async {
    var pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    image = File(pickedImage!.path); // won't have any error now
    emit(state.copyWith(imagePath: pickedImage.path));
  }
}
