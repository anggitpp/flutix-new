import 'package:flutix/controllers/registration_page_controller.dart';
import 'package:get/get.dart';

class RegistrationPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(RegistrationPageController());
  }
}
