part of 'main_bloc.dart';

sealed class MainEvent {
  const MainEvent();
}

final class Incremented extends MainEvent {
  const Incremented();
}

final class Decremented extends MainEvent {
  const Decremented();
}
