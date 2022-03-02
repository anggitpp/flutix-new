import 'package:flutix/controllers/select_cinema_page.controller.dart';
import 'package:get/get.dart';

class SelectCinemaPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SelectCinemaPageController());
  }
}
