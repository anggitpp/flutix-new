import 'package:get/get.dart';

class HomePageController extends GetxController {
  RxInt num = 0.obs;

  void count() => num++;
}
