import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weight_trend/chart/chart_widget.dart';

import 'chart_bloc.dart';

class ChartScreen extends StatelessWidget {
  const ChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<ChartBloc>(
        create: (context) => ChartBloc(),
        child: ChartContent(0),
      ),
    );
  }
}

class ChartContent extends StatelessWidget {
  const ChartContent(
    int count, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(
                  height: 37,
                ),
                Text(
                  'Weight Trend',
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 37,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16, left: 6),
                    child: BlocBuilder<ChartBloc, ChartState>(
                      builder: (context, state) {
                        return switch (state) {
                          ChartInitial() => ChartWidget(buildContext: context, weight: state.weight),
                        };
                      },
                    ),
                  ),
                ),
                // const SizedBox(
                //   height: 500,
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
