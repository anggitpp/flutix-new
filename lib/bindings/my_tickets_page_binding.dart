import 'package:flutix/controllers/my_tickets_page_controller.dart';
import 'package:get/get.dart';

class MyTicketsPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MyTicketsPageController());
  }
}
