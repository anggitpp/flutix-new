import 'package:flutix/controllers/select_seat_page_controller.dart';
import 'package:flutix/models/movie.dart';
import 'package:flutix/models/seat_row.dart';
import 'package:flutix/screens/widgets/textbox_widget.dart';
import '../../config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../widgets/button_next.dart';

class SelectSeatPage extends StatelessWidget {
  const SelectSeatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SelectSeatPageController>();

    var phoneWidth = MediaQuery.of(context).size.width;
    Movie movie = Get.arguments['movie'];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  left: AppSizes.defaultMargin,
                  right: AppSizes.defaultMargin,
                  top: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: const Icon(
                        Icons.arrow_back,
                        size: 24,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 56,
                          width: 110,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                movie.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.right,
                                style: AppTextStyle.largeText.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: AssetImage('assets/movies/' + movie.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: phoneWidth - 2 * 40,
                height: 84,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage('assets/screen.png'),
                  ),
                ),
              ),
              ListView.builder(
                itemCount: dummySeats.length,
                shrinkWrap: true,
                itemBuilder: ((context, index) {
                  return SizedBox(
                    width: 60,
                    height: 60,
                    child: Center(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: dummySeats[index].seats.length,
                        shrinkWrap: true,
                        itemBuilder: ((context, i) {
                          var seat = dummySeats[index].seats[i];
                          return Container(
                            margin: EdgeInsets.only(
                              right: i == dummySeats[index].seats.length - 1
                                  ? 0
                                  : 16,
                              bottom: 16,
                            ),
                            child: Obx(
                              () => GestureDetector(
                                onTap: () => controller.addSelectedSeats(seat),
                                child: TextBoxWidget(
                                  width: 45,
                                  height: 50,
                                  color: controller.selectedSeats.contains(seat)
                                      ? AppColors.yellowColor
                                      : Colors.transparent,
                                  text: seat,
                                  isCurrency: true,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: AppColors.lightGreyColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Available',
                    style: AppTextStyle.greySmallText.copyWith(fontSize: 10),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: AppColors.lightGreyColor,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: AppColors.lightGreyColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Booked',
                    style: AppTextStyle.greySmallText.copyWith(fontSize: 10),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: AppColors.yellowColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Selected',
                    style: AppTextStyle.greySmallText.copyWith(fontSize: 10),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Obx(
                () => GestureDetector(
                  onTap: () => Get.toNamed('/checkout', arguments: {
                    'movie': movie,
                    'cinema': Get.arguments['cinema'],
                    'seat': controller.selectedSeats,
                    'time': Get.arguments['time'],
                    'date': Get.arguments['date'],
                  }),
                  child: ButtonNext(
                    arrowColor: controller.isCanNextStep.value
                        ? Colors.white
                        : AppColors.darkGreyColor,
                    backgroundColor: controller.isCanNextStep.value
                        ? AppColors.purpleColor
                        : AppColors.lightGreyColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
