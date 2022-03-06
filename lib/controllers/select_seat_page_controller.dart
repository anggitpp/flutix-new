import 'package:get/get.dart';

class SelectSeatPageController extends GetxController {
  var isCanNextStep = false.obs;
  RxList<String> selectedSeats = RxList<String>();

  void addSelectedSeats(String item) {
    if (selectedSeats.contains(item)) {
      selectedSeats.remove(item);
    } else {
      if (selectedSeats.length < 6) {
        selectedSeats.add(item);
      }
    }
    checkNotEmpty();
  }

  void checkNotEmpty() {
    if (selectedSeats.isNotEmpty) {
      isCanNextStep.value = true;
    } else {
      isCanNextStep.value = false;
    }
  }
}
