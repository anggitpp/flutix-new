import 'package:flutter/material.dart';

import 'package:flutix/shared/theme.dart';

class StarWidget extends StatelessWidget {
  final int star;
  final bool isBanner;

  const StarWidget({
    Key? key,
    required this.star,
    this.isBanner = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 1; i <= 5; i++)
          Icon(
            Icons.star,
            color: (star / 2).toDouble().round() >= i
                ? yellowColor
                : isBanner
                    ? Colors.white
                    : lightGreyColor,
            size: 20,
          ),
      ],
    );
  }
}
