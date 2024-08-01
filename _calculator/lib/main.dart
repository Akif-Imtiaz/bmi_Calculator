import 'package:flutter/material.dart';
import 'package:_calculator/input_page.dart';


void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  late final Color primaryColor;
  


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0XFF0A0E21),
        scaffoldBackgroundColor: Color(0XFF0A0E21),
        textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white)),
        
      ),

      home: InputPage(),
    );
  }
}

