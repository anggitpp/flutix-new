import 'package:flutix/config/theme.dart';
import 'package:flutter/material.dart';

class ButtonText extends StatelessWidget {
  final Color color;
  final String text;
  final Function()? function;

  const ButtonText({
    Key? key,
    required this.color,
    required this.text,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 45,
      child: ElevatedButton(
        onPressed: function,
        child: Text(
          text,
          style: AppTextStyle.mediumText.copyWith(
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
            primary: color,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      ),
    );
  }
}
