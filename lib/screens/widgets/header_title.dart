import 'package:flutter/material.dart';

import 'package:flutix/shared/theme.dart';

class HeaderTitle extends StatelessWidget {
  final String title;
  final Function backFunction;

  const HeaderTitle({
    Key? key,
    this.title = '',
    required this.backFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: defaultMargin,
        right: defaultMargin,
        top: 36,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              backFunction();
            },
            child: const Icon(
              Icons.arrow_back,
              size: 24,
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: largeText.copyWith(fontWeight: FontWeight.w600, height: 1.5),
          ),
          const SizedBox(
            width: 24,
          ),
        ],
      ),
    );
  }
}
