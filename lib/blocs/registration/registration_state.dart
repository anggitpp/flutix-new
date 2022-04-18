part of 'registration_cubit.dart';

enum RegistrationStatus {
  initial,
  submitting,
  success,
  error,
}

class RegistrationState extends Equatable {
  final RegistrationStatus registrationStatus;
  final Color nameLabelColor;
  final Color emailLabelColor;
  final Color passwordLabelColor;
  final Color confirmPasswordLabelColor;
  final bool isCanSignUp;
  final bool isLoadedImage;
  final String imagePath;
  final CustomError error;
  const RegistrationState({
    required this.registrationStatus,
    required this.nameLabelColor,
    required this.emailLabelColor,
    required this.passwordLabelColor,
    required this.confirmPasswordLabelColor,
    required this.isCanSignUp,
    required this.isLoadedImage,
    required this.imagePath,
    required this.error,
  });

  factory RegistrationState.initial() {
    return RegistrationState(
      registrationStatus: RegistrationStatus.initial,
      nameLabelColor: AppColors.greyColor,
      emailLabelColor: AppColors.greyColor,
      passwordLabelColor: AppColors.greyColor,
      confirmPasswordLabelColor: AppColors.greyColor,
      isCanSignUp: false,
      isLoadedImage: false,
      imagePath: '',
      error: const CustomError(),
    );
  }

  RegistrationState copyWith({
    RegistrationStatus? registrationStatus,
    Color? nameLabelColor,
    Color? emailLabelColor,
    Color? passwordLabelColor,
    Color? confirmPasswordLabelColor,
    bool? isCanSignUp,
    bool? isLoadedImage,
    String? imagePath,
    File? image,
    CustomError? error,
  }) {
    return RegistrationState(
      registrationStatus: registrationStatus ?? this.registrationStatus,
      nameLabelColor: nameLabelColor ?? this.nameLabelColor,
      emailLabelColor: emailLabelColor ?? this.emailLabelColor,
      passwordLabelColor: passwordLabelColor ?? this.passwordLabelColor,
      confirmPasswordLabelColor:
          confirmPasswordLabelColor ?? this.confirmPasswordLabelColor,
      isCanSignUp: isCanSignUp ?? this.isCanSignUp,
      isLoadedImage: isLoadedImage ?? this.isLoadedImage,
      imagePath: imagePath ?? this.imagePath,
      error: error ?? this.error,
    );
  }

  @override
  String toString() {
    return 'RegistrationState(registrationStatus: $registrationStatus, nameLabelColor: $nameLabelColor, emailLabelColor: $emailLabelColor, passwordLabelColor: $passwordLabelColor, confirmPasswordLabelColor: $confirmPasswordLabelColor, isCanSignUp: $isCanSignUp, isLoadedImage: $isLoadedImage, imagePath: $imagePath, error: $error)';
  }

  @override
  List<Object> get props {
    return [
      registrationStatus,
      nameLabelColor,
      emailLabelColor,
      passwordLabelColor,
      confirmPasswordLabelColor,
      isCanSignUp,
      isLoadedImage,
      imagePath,
      error,
    ];
  }
}
