import 'package:flutix/controllers/edit_profile_page_controller.dart';
import 'package:get/get.dart';

class EditProfilePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(EditProfilePageController());
  }
}
