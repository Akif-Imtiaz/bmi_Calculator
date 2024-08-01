import 'dart:math';

class CalculatorBrain {
  final int? height;
  final int? weight;
  double? _bmi;

  CalculatorBrain({this.height, this.weight}) {
    // Initialize _bmi in the constructor
    _bmi = weight! / pow(height! / 100, 2);
  }

  String calculateBMI() {
    // Return the already calculated _bmi
    return _bmi!.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi! >= 25) {
      return 'Overweight';
    } else if (_bmi! > 18.5) {
      return 'Normal weight';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi! >= 25) {
      return 'You have higher weight than normal';
    } else if (_bmi! > 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have lower weight than normal';
    }
  }
}
