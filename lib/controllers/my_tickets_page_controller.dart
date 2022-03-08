import 'package:get/get.dart';

class MyTicketsPageController extends GetxController {
  List<String> tabs = [
    'Newest',
    'Oldest',
  ];

  RxString selectedTab = 'Newest'.obs;

  void selectTab(tab) {
    selectedTab.value = tab;
  }
}
