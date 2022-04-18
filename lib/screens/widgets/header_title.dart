import 'package:flutter/material.dart';

import '../../config/theme.dart';

class HeaderTitle extends StatelessWidget {
  final String title;
  final Function? backFunction;

  const HeaderTitle({
    Key? key,
    this.title = '',
    required this.backFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppSizes.defaultMargin,
        right: AppSizes.defaultMargin,
        top: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => backFunction,
            child: const Icon(
              Icons.arrow_back,
              size: 24,
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyle.largeText
                .copyWith(fontWeight: FontWeight.w600, height: 1.5),
          ),
          const SizedBox(
            width: 24,
          ),
        ],
      ),
    );
  }
}
