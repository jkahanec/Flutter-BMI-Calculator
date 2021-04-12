import 'package:bmi_calculator/components/common_app_bar.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/constants.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender {
  male,
  female,
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 74;
  int weight = 180;
  int age = 21;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  //MALE CARD
                  child: ReusableCard(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: (selectedGender == Gender.male)
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: IconContent(
                      iconData: FontAwesomeIcons.mars,
                      iconSize: 80.0,
                      text: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  //FEMALE CARD
                  child: ReusableCard(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: (selectedGender == Gender.female)
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: IconContent(
                      iconData: FontAwesomeIcons.venus,
                      iconSize: 80.0,
                      text: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            //slider box
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'HEIGHT',
                          style: primaryTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              (height ~/ 12).toString(),
                              style: heightTextStyle,
                            ),
                            Text('ft'),
                            SizedBox(
                              width: 5,
                            ),
                            Text((height % 12).toString(),
                                style: heightTextStyle),
                            Text('in')
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: 36,
                            max: 108,
                            activeColor: actionActiveColor,
                            inactiveColor: actionInactiveColor,
                            onChanged: (double value) {
                              setState(() {
                                height = value.round();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    color: inactiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: primaryTextStyle,
                        ),
                        Text(weight.toString(), style: heightTextStyle),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RoundIconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (weight > 1) {
                                        weight--;
                                      }
                                    });
                                  },
                                  icon: FontAwesomeIcons.minus),
                              RoundIconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (weight < 500) {
                                        weight++;
                                      }
                                    });
                                  },
                                  icon: FontAwesomeIcons.plus),
                            ]),
                      ],
                    ),
                    color: inactiveCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: primaryTextStyle,
                        ),
                        Text(age.toString(), style: heightTextStyle),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    if (age > 18) {
                                      age--;
                                    }
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                              ),
                              RoundIconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (age < 120) {
                                        age++;
                                      }
                                    });
                                  },
                                  icon: FontAwesomeIcons.plus),
                            ]),
                      ],
                    ),
                    color: inactiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                resultsRoute,
                arguments: BmiCalculatorArguments(
                  height: height,
                  weight: weight,
                ),
              );
            },
            child: Container(
                color: actionActiveColor,
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    'CALCULATE',
                    style: largeButtonTextStyle,
                  )
                ]),
                height: 80.0),
          )
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onPressed});
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: activeCardColor,
      elevation: 3,
      child: Icon(icon),
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      onPressed: onPressed,
    );
  }
}
