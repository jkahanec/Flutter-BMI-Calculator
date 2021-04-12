import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class IconContent extends StatelessWidget {
  IconContent(
      {@required this.iconData, @required this.iconSize, @required this.text});

  final double iconSize;
  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(iconData, size: iconSize),
        SizedBox(
          height: 30.0,
          child: Text(
            text, //'MALE',
            style: primaryTextStyle,
          ),
        ),
      ],
    );
  }
}
