import 'package:bmi_calculator/bmi_calculator.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/common_app_bar.dart';
import 'package:bmi_calculator/constants.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BmiCalculatorArguments args =
        ModalRoute.of(context).settings.arguments as BmiCalculatorArguments;

    final BMICalculator bmiCalculator =
        BMICalculator(height: args.height, weight: args.weight);
    return Scaffold(
      appBar: CommonAppBar(),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              padding: EdgeInsets.all(8),
              child:
                  Center(child: Text('Your Result', style: resultsTitleStyle))),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: inactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(bmiCalculator.getClassification(),
                      style: bmiClassificationTextStyle),
                  Text(bmiCalculator.getBMI(), style: bmiTextStyle),
                  Padding(
                    padding: EdgeInsets.only(left: 8, right: 8),
                    child: Text(
                      bmiCalculator.getInterpretation(),
                      style: primaryTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                color: actionActiveColor,
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    'RE-CALCULATE',
                    style: largeButtonTextStyle,
                  )
                ]),
                height: 80.0),
          )
        ],
      )),
    );
  }
}

// used to pass arguments to results page from named route
class BmiCalculatorArguments {
  BmiCalculatorArguments({this.height, this.weight});
  final int height;
  final int weight;
}
