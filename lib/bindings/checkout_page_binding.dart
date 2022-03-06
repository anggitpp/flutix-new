import 'package:flutix/controllers/checkout_page_controller.dart';
import 'package:get/get.dart';

class CheckoutPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CheckoutPageController());
  }
}
