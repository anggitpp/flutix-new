part of 'tickets_cubit.dart';

class TicketsState extends Equatable {
  final String selectedTab;
  const TicketsState({
    required this.selectedTab,
  });

  factory TicketsState.initial() {
    return const TicketsState(selectedTab: 'Newest');
  }

  TicketsState copyWith({
    String? selectedTab,
  }) {
    return TicketsState(
      selectedTab: selectedTab ?? this.selectedTab,
    );
  }

  @override
  String toString() => 'TicketsState(selectedTab: $selectedTab)';

  @override
  List<Object> get props => [selectedTab];
}
