import 'package:flutter/material.dart';
import 'counter_home.dart';

class ScoreCounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Basket Ball Score Counter",
      theme: ThemeData(
        primaryColor: Color(0xFFFF6D02),
        primaryColorDark: Color(0xFFDF5D02),
      ),
      home: CounterHome(),
    );
  }
}
