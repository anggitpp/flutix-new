import 'package:flutter/material.dart';

import '../../config/theme.dart';

// ignore: must_be_immutable
class CreateTextFormField extends StatelessWidget {
  bool obsecureText;
  Color? labelColor;
  Function? checkFunction;
  String label;
  String? Function(String?)? validator;
  String? Function(String?)? onSaved;
  TextEditingController? controller;
  CreateTextFormField({
    Key? key,
    this.obsecureText = false,
    this.labelColor,
    this.checkFunction,
    this.validator,
    this.onSaved,
    this.controller,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        if (checkFunction != null) {
          checkFunction!();
        }
      },
      validator: validator,
      onSaved: onSaved,
      controller: controller,
      obscureText: obsecureText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: AppTextStyle.greyMediumText.copyWith(color: labelColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: AppColors.lightGreyColor, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: AppColors.yellowColor, width: 1),
        ),
      ),
    );
  }
}
