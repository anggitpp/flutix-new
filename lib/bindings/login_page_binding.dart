import 'package:flutix/controllers/login_page_controller.dart';
import 'package:get/get.dart';

class LoginPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginPageController());
  }
}
