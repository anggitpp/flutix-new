part of 'confirm_account_cubit.dart';

enum ConfirmAccountStatus {
  initial,
  submitting,
  success,
  error,
}

class ConfirmAccountState extends Equatable {
  final ConfirmAccountStatus confirmAccountStatus;
  final CustomError error;
  const ConfirmAccountState({
    required this.confirmAccountStatus,
    required this.error,
  });

  factory ConfirmAccountState.initial() {
    return const ConfirmAccountState(
        confirmAccountStatus: ConfirmAccountStatus.initial,
        error: CustomError());
  }

  ConfirmAccountState copyWith({
    ConfirmAccountStatus? confirmAccountStatus,
    CustomError? error,
  }) {
    return ConfirmAccountState(
      confirmAccountStatus: confirmAccountStatus ?? this.confirmAccountStatus,
      error: error ?? this.error,
    );
  }

  @override
  String toString() =>
      'ConfirmAccountState(confirmAccountStatus: $confirmAccountStatus, error: $error)';

  @override
  List<Object> get props => [confirmAccountStatus, error];
}
