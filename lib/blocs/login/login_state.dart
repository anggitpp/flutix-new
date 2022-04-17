part of 'login_cubit.dart';

enum LoginStatus {
  initial,
  submitting,
  success,
  error,
}

class LoginState extends Equatable {
  final LoginStatus loginStatus;
  final bool isCanSignIn;
  final Color emailLabelColor;
  final Color passwordLabelColor;
  final CustomError error;
  const LoginState({
    required this.loginStatus,
    required this.isCanSignIn,
    required this.emailLabelColor,
    required this.passwordLabelColor,
    required this.error,
  });

  factory LoginState.initial() {
    return LoginState(
        loginStatus: LoginStatus.initial,
        isCanSignIn: false,
        emailLabelColor: AppColors.greyColor,
        passwordLabelColor: AppColors.greyColor,
        error: const CustomError());
  }

  LoginState copyWith({
    LoginStatus? loginStatus,
    bool? isCanSignIn,
    Color? emailLabelColor,
    Color? passwordLabelColor,
    CustomError? error,
  }) {
    return LoginState(
      loginStatus: loginStatus ?? this.loginStatus,
      isCanSignIn: isCanSignIn ?? this.isCanSignIn,
      emailLabelColor: emailLabelColor ?? this.emailLabelColor,
      passwordLabelColor: passwordLabelColor ?? this.passwordLabelColor,
      error: error ?? this.error,
    );
  }

  @override
  String toString() {
    return 'LoginState(loginStatus: $loginStatus, isCanSignIn: $isCanSignIn, emailLabelColor: $emailLabelColor, passwordLabelColor: $passwordLabelColor, error: $error)';
  }

  @override
  List<Object> get props {
    return [
      loginStatus,
      isCanSignIn,
      emailLabelColor,
      passwordLabelColor,
      error,
    ];
  }
}
