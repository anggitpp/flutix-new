import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'select_genre_state.dart';

class SelectGenreCubit extends Cubit<SelectGenreState> {
  SelectGenreCubit() : super(SelectGenreState.initial());

  void addSelectedGenre(String item) {
    List<String> genres = state.selectedGenres;

    if (genres.contains(item)) {
      emit(state.copyWith(
          selectedGenres: genres.where((element) => element != item).toList()));
    } else {
      if (state.selectedGenres.length < 2) {
        emit(state.copyWith(selectedGenres: [...genres, item]));
      }
    }
    _checkNotEmpty();
  }

  void selectLanguage(String item) {
    emit(state.copyWith(selectedLanguage: item));

    _checkNotEmpty();
  }

  void _checkNotEmpty() {
    if (state.selectedGenres.length == 2 && state.selectedLanguage != '') {
      emit(state.copyWith(isCanNextStep: true));
    } else {
      emit(state.copyWith(isCanNextStep: false));
    }
  }
}
