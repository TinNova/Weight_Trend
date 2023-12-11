import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_bloc.dart';

class MainScreen extends StatelessWidget {
  static const String id = 'main_screen';

  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<MainBloc>(
        create: (context) => MainBloc(),
        child: MainContent(0),
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent(
    int count, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Actions(),
        ],
      ),
    );
  }
}

class Actions extends StatelessWidget {
  const Actions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...switch (state) {
              MainInitial() => [Counter(state.count)],
              MainUpdated() => [Counter(state.count)],
            },
          ],
        );
      },
    );
  }
}

class Counter extends StatelessWidget {
  Counter(this.count);

  final int count;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Count: $count',
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                if (count > 0) {
                  context.read<MainBloc>().add(Decremented());
                } else {
                  null;
                }
              },
              child: Icon(Icons.remove),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<MainBloc>().add(Incremented());
              },
              child: Icon(Icons.add),
            ),
          ],
        ),
      ],
    );
  }
}
