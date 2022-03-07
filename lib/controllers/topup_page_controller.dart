import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TopupPageController extends GetxController {
  var isCanTopUp = false.obs;
  RxInt selectedTemplate = 0.obs;

  TextEditingController amountController = TextEditingController();

  void onChangeAmount(amount) {
    var convertedAmount = amount.toString().replaceAll('.', '');
    var formattedAmount =
        NumberFormat.currency(locale: 'id', decimalDigits: 0, symbol: '')
            .format(int.parse(convertedAmount));
    amountController.text = formattedAmount;

    checkNotEmpty();
  }

  void onTapTemplate(amount) {
    selectedTemplate.value = amount;
    amountController.text =
        NumberFormat.currency(locale: 'id', decimalDigits: 0, symbol: '')
            .format(amount);

    checkNotEmpty();
  }

  void checkNotEmpty() {
    if (amountController.text != '') {
      isCanTopUp.value = true;
    } else {
      isCanTopUp.value = false;
    }
  }
}
