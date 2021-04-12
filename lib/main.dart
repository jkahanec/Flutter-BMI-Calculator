import 'package:flutter/material.dart';
import 'screens/input_page.dart';
import 'constants.dart';
import 'screens/results_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: themePrimaryColor,
          scaffoldBackgroundColor: scaffoldBackgroundColor), //5D8DC0)),
      initialRoute: inputRoute,
      routes: {
        inputRoute: (context) => InputPage(),
        resultsRoute: (context) => ResultsPage(),
      },
    );
  }
}
