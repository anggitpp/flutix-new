import 'package:flutix/screens/widgets/header_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          HeaderTitle(
            backFunction: () => Get.back(),
            title: 'Checkout\nMovie',
          ),
        ],
      )),
    );
  }
}
