import 'package:flutix/controllers/topup_page_controller.dart';
import 'package:get/get.dart';

class TopupPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(TopupPageController());
  }
}
