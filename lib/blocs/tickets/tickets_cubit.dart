import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tickets_state.dart';

class TicketsCubit extends Cubit<TicketsState> {
  TicketsCubit() : super(TicketsState.initial());

  void selectTab(tab) {
    emit(state.copyWith(selectedTab: tab));
  }
}
