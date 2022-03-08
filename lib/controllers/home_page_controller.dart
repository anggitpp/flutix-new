import 'package:get/get.dart';

class HomePageController extends GetxController {
  RxString selectedPage = 'movies'.obs;

  List<String> pages = [
    'movies',
    'tickets',
  ];

  List<String> tabs = [
    'Newest',
    'Oldest',
  ];

  RxString selectedTab = 'Newest'.obs;

  void changePage(page) {
    selectedPage.value = page;
  }

  void selectTab(tab) {
    selectedTab.value = tab;
  }
}
