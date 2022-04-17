import 'package:flutter/material.dart';

import '../../config/theme.dart';

class TextBoxWidget extends StatelessWidget {
  const TextBoxWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.color,
    required this.text,
    this.isCurrency = false,
  }) : super(key: key);

  final double width;
  final double height;
  final Color color;
  final String text;
  final bool isCurrency;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: color,
        border: Border.all(color: AppColors.lightGreyColor, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: isCurrency
                ? AppTextStyle.currencySmallText.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  )
                : AppTextStyle.mediumText.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
          ),
        ],
      ),
    );
  }
}
