import 'package:flutix/controllers/select_seat_page_controller.dart';
import 'package:get/get.dart';

class SelectSeatPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SelectSeatPageController());
  }
}
