import 'package:flutix/controllers/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final controller = Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => Text(
              'Nomor : ${controller.num}',
            ),
          ),
          ElevatedButton(
              onPressed: () => controller.count(), child: Text('Tambah')),
          ElevatedButton(onPressed: () => Get.back(), child: Text('Back'))
        ],
      )),
    );
  }
}
