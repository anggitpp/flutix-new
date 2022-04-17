import 'package:flutix/config/theme.dart';
import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutix/models/custom_error.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial());

  void checkValid(String email, String password) {
    if (email.isNotEmpty && password.isNotEmpty) {
      emit(state.copyWith(isCanSignIn: true));
    } else {
      emit(state.copyWith(isCanSignIn: false));
    }
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
}
