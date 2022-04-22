import 'package:another_flushbar/flushbar.dart';
import 'package:flutix/config/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> snackBar(BuildContext context, String text) {
  return Flushbar(
    message: text,
    duration: const Duration(seconds: 2),
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: AppColors.purpleColor,
  ).show(context);
}
