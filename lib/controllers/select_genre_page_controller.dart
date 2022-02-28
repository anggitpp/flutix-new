import 'package:get/get.dart';

class SelectGenrePageController extends GetxController {
  var isCanSignUp = false.obs;
  RxList<String> selectedGenres = RxList<String>();
  RxString selectedLang = ''.obs;

  void addSelectedGenre(String item) {
    if (selectedGenres.contains(item)) {
      selectedGenres.remove(item);
    } else {
      if (selectedGenres.length < 2) {
        selectedGenres.add(item);
      }
    }
    checkNotEmpty();
  }

  void selectLanguage(String item) {
    selectedLang.value = item;

    checkNotEmpty();
  }

  void checkNotEmpty() {
    if (selectedGenres.length == 2 && selectedLang.value != '') {
      isCanSignUp.value = true;
    } else {
      isCanSignUp.value = false;
    }
  }
}
