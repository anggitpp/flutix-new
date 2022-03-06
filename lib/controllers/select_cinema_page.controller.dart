import 'package:flutix/model/cinema.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class SelectCinemaPageController extends GetxController {
  List<String> days = List.generate(
    7,
    (i) => _formatDateTime(
      DateTime.now().add(Duration(days: i)),
    ),
  );

  var isCanNextStep = false.obs;

  List<String> times = [
    '10:20',
    '12:20',
    '14:20',
    '16:20',
    '18:20',
  ];

  RxString selectedDate = ''.obs;
  Cinema? selectedCinema;
  RxInt selectedCinemaId = 0.obs;
  RxString selectedTime = ''.obs;

  void selectDate(String item) {
    selectedDate.value = item;

    checkNotEmpty();
  }

  void selectCinema(Cinema cinema, String time) {
    selectedCinemaId.value = cinema.id;
    selectedCinema = cinema;
    selectedTime.value = time;

    update();

    checkNotEmpty();
  }

  void checkNotEmpty() {
    if (selectedDate.value != '' && selectedTime.value != '') {
      isCanNextStep.value = true;
    } else {
      isCanNextStep.value = false;
    }

    update();
  }
}

String _formatDateTime(DateTime dateTime) {
  initializeDateFormatting();

  return DateFormat('EE dd', 'id').format(dateTime);
}
