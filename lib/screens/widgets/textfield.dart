import 'package:flutter/material.dart';

import '../../config/theme.dart';

// ignore: must_be_immutable
class CreateTextField extends StatelessWidget {
  TextEditingController controller;
  bool obsecureText;
  Color? labelColor;
  Function? checkFunction;
  String label;
  CreateTextField({
    Key? key,
    required this.controller,
    this.obsecureText = false,
    this.labelColor,
    this.checkFunction,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (value) {
        if (checkFunction != null) {
          checkFunction!();
        }
      },
      obscureText: obsecureText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: AppTextStyle.greyMediumText.copyWith(color: labelColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: AppColors.lightGreyColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: AppColors.yellowColor, width: 1),
        ),
      ),
    );
  }
}
