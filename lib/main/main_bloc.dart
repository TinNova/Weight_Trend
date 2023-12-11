import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {

  int _count = 0;

  MainBloc() : super(MainInitial(0)) {
    on<Incremented>(_onIncrement);
    on<Decremented>(_onDecrement);
  }

  void _onIncrement(Incremented event, Emitter<MainState> emit) {
    emit(MainUpdated(++_count));
  }

  void _onDecrement(Decremented event, Emitter<MainState> emit) {
    emit(MainUpdated(--_count));
  }
}
