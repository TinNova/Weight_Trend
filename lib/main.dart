import 'package:flutter/material.dart';

import 'chart/chart_screen.dart';
import 'main/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LineChartSample1(),

      ///Use the below commented out code once you have more screens
      // initialRoute: MainScreen.id,
      // routes: {
      //   LoginScreen.id: (context) => LoginScreen(),
      //   MainScreen.id: (context) => MainScreen(),
      // },
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: Brightness.dark,
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: Colors.white,
            fontSize: 50,
            fontWeight: FontWeight.w900,
            letterSpacing: 1,
          ),
          labelSmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
