import 'package:flutter/material.dart';
import 'package:test_dy/onBoarding.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Algoriza',
        debugShowCheckedModeBanner: false,
        home: OnBoarding());
  }
}
