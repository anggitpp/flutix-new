import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:flutix/config/theme.dart';
import 'package:flutix/models/custom_error.dart';
import 'package:flutix/repositories/auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository authRepository;
  LoginCubit({
    required this.authRepository,
  }) : super(LoginState.initial());

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

  Future<void> signIn(String email, String password) async {
    emit(state.copyWith(loginStatus: LoginStatus.submitting));
    try {
      await authRepository.signIn(email: email, password: password);

      emit(state.copyWith(loginStatus: LoginStatus.success));
    } on CustomError catch (e) {
      emit(state.copyWith(loginStatus: LoginStatus.error, error: e));
    }
  }
}
