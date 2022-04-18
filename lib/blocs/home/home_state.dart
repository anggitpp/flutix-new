part of 'home_cubit.dart';

class HomeState extends Equatable {
  final String selectedPage;
  const HomeState({
    required this.selectedPage,
  });

  factory HomeState.initial() {
    return const HomeState(selectedPage: 'movies');
  }

  HomeState copyWith({
    String? selectedPage,
  }) {
    return HomeState(
      selectedPage: selectedPage ?? this.selectedPage,
    );
  }

  @override
  String toString() => 'HomeState(selectedPage: $selectedPage)';

  @override
  List<Object> get props => [selectedPage];
}
