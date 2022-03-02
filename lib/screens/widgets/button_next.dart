import 'package:flutter/material.dart';

class ButtonNext extends StatelessWidget {
  final Color arrowColor;
  final Color backgroundColor;

  const ButtonNext({
    Key? key,
    required this.arrowColor,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 60,
        height: 60,
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: backgroundColor),
        child: Icon(
          Icons.arrow_forward,
          color: arrowColor,
          size: 30,
        ),
      ),
    );
  }
}
