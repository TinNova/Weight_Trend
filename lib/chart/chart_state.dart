part of 'chart_bloc.dart';

sealed class ChartState extends Equatable {
  const ChartState(this.weight, this.trend);

  final Weight weight;
  final Weight trend;
}

  final class ChartInitial extends ChartState {
  ChartInitial(weight, trend) : super(weight, trend);

  @override
  List<Object?> get props => [weight, trend];
}
