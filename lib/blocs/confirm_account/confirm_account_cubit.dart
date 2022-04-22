import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutix/models/custom_error.dart';
import 'package:flutix/repositories/auth_repository.dart';

part 'confirm_account_state.dart';

class ConfirmAccountCubit extends Cubit<ConfirmAccountState> {
  final AuthRepository authRepository;
  ConfirmAccountCubit({required this.authRepository})
      : super(ConfirmAccountState.initial());

  Future<void> confirmAccount(String name, String email, List<String> genres,
      String language, String imagePath) async {
    emit(state.copyWith(confirmAccountStatus: ConfirmAccountStatus.submitting));

    try {
      await authRepository.confirmAccount(
        name: name,
        email: email,
        genres: genres,
        language: language,
        imagePath: imagePath,
      );

      emit(state.copyWith(confirmAccountStatus: ConfirmAccountStatus.success));
    } on CustomError catch (e) {
      emit(state.copyWith(
          confirmAccountStatus: ConfirmAccountStatus.error, error: e));
    }
  }
}
