import 'package:flutix/controllers/topup_page_controller.dart';
import '../../widgets/button_text.dart';
import 'package:flutix/screens/widgets/header_title.dart';
import '../../config/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TopupPage extends StatelessWidget {
  const TopupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TopupPageController>();
    final List<int> amounts = [
      50000,
      100000,
      150000,
      200000,
      250000,
      500000,
      1000000,
      2500000,
      5000000,
    ];
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderTitle(
              backFunction: Get.back,
              title: 'Top Up',
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    onChanged: (value) => controller.onChangeAmount(value),
                    controller: controller.amountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Amount',
                      labelStyle: AppTextStyle.greyMediumText,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(
                            color: AppColors.lightGreyColor, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(
                            color: AppColors.lightGreyColor, width: 1),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Choose by Template',
                    style: AppTextStyle.smallText,
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Wrap(
                    spacing: 20,
                    runSpacing: 15,
                    children: amounts
                        .map(
                          (e) => InkWell(
                            onTap: () => controller.onTapTemplate(e),
                            child: Obx(
                              () => Container(
                                width: 90,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: e == controller.selectedTemplate.value
                                      ? AppColors.yellowColor
                                      : Colors.white,
                                  border: Border.all(
                                      color: AppColors.lightGreyColor,
                                      width: 1),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'IDR',
                                      style:
                                          e == controller.selectedTemplate.value
                                              ? AppTextStyle.mediumText
                                              : AppTextStyle.greyMediumText,
                                    ),
                                    Text(
                                      NumberFormat.currency(
                                              symbol: '',
                                              decimalDigits: 0,
                                              locale: 'id')
                                          .format(e),
                                      style: AppTextStyle.currencySmallText
                                          .copyWith(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Obx(
                    () => Center(
                      child: ButtonText(
                        color: controller.isCanTopUp.value
                            ? AppColors.greenColor
                            : AppColors.greyColor,
                        text: 'Top Up Now',
                        function: controller.isCanTopUp.value
                            ? () => Get.toNamed('/success', arguments: {
                                  'image': 'success_topup.png',
                                  'title': 'Emmm Yummy!',
                                  'text1': 'You have successfully',
                                  'text2': 'top up the wallet',
                                  'buttonText': 'My Wallet',
                                })
                            : () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
