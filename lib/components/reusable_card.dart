import 'package:flutter/material.dart';

void empty() {}

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.color, this.cardChild, this.onTap = empty});

  final Color color;
  final Widget cardChild;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
