import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;
  final int age;

  CalculatorBrain(this.height, this.weight, this.age);

  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi > 25) {
      return "Overeweight";
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "UnderWeight";
    }
  }

  String getDescription(){
      if (_bmi > 25) {
      return "You have a higher than normal body weight. Try to excerxise more";
    } else if (_bmi > 18.5) {
      return "You have a normal body weight. Good Job! ";
    } else {
      return "You have a lower than normal body weight. You can eat a bit more.";
    }
  }
}
