part of 'select_genre_cubit.dart';

class SelectGenreState extends Equatable {
  final List<String> selectedGenres;
  final String selectedLanguage;
  final bool isCanNextStep;
  const SelectGenreState({
    required this.selectedGenres,
    required this.selectedLanguage,
    required this.isCanNextStep,
  });

  factory SelectGenreState.initial() {
    return const SelectGenreState(
        selectedGenres: [], selectedLanguage: '', isCanNextStep: false);
  }

  SelectGenreState copyWith({
    List<String>? selectedGenres,
    String? selectedLanguage,
    bool? isCanNextStep,
  }) {
    return SelectGenreState(
      selectedGenres: selectedGenres ?? this.selectedGenres,
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
      isCanNextStep: isCanNextStep ?? this.isCanNextStep,
    );
  }

  @override
  String toString() =>
      'SelectGenreState(selectedGenres: $selectedGenres, selectedLanguage: $selectedLanguage, isCanNextStep: $isCanNextStep)';

  @override
  List<Object> get props => [selectedGenres, selectedLanguage, isCanNextStep];
}
