part of 'main_bloc.dart';

sealed class MainState extends Equatable {
  const MainState(this.count);
  final int count;

  @override
  List<Object?> get props => [count];
}

final class MainInitial extends MainState {
  MainInitial(int count) : super(count);
}

final class MainUpdated extends MainState {
  MainUpdated(int count) : super(count);
}
