import 'package:flutix/controllers/select_genre_page_controller.dart';
import 'package:get/get.dart';

class SelectGenrePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SelectGenrePageController());
  }
}
