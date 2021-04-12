class BMICalculator {
  BMICalculator({this.height, this.weight}) {
    _bmi = weight / (height * height) * 703;
  }
  double _bmi;
  final int height; // in inches
  final int weight; // in pounds

  String getBMI() {
    return _bmi.toStringAsFixed(1);
  }

  String getClassification() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi >= 18) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You should eat a bit more.';
    }
  }
}
