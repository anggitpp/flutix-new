import 'package:flutix/controllers/select_cinema_page.controller.dart';
import 'package:flutix/models/cinema.dart';
import '../../config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SelectCinemaPage extends StatelessWidget {
  const SelectCinemaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final phoneWidth = MediaQuery.of(context).size.width;
    final controller = Get.find<SelectCinemaPageController>();

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
          child: Column(
            children: [
              const SizedBox(
                height: 36,
              ),
              Container(
                width: phoneWidth,
                padding: const EdgeInsets.only(left: AppSizes.defaultMargin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () => Get.back(),
                      child: const Icon(
                        Icons.arrow_back,
                        size: 24,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Choose Date',
                      style: AppTextStyle.largeText
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 90,
                width: double.infinity,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.days.length,
                  itemBuilder: (context, index) {
                    var day = controller.days[index].split(' ');
                    return InkWell(
                      onTap: () => controller.selectDate(day[1]),
                      child: Obx(
                        () => Container(
                          height: 90,
                          width: 70,
                          margin: EdgeInsets.only(
                            left: index == 0 ? AppSizes.defaultMargin : 16,
                            right: index == controller.days.length - 1
                                ? AppSizes.defaultMargin
                                : 0,
                          ),
                          decoration: BoxDecoration(
                            color: controller.selectedDate.value == day[1]
                                ? AppColors.yellowColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                                color: AppColors.greyColor, width: 1),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                day[0].toUpperCase(),
                                style: AppTextStyle.mediumText,
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                day[1],
                                style: AppTextStyle.currencySmallText.copyWith(
                                    fontSize: 16, color: Colors.black),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: dummyCinemas.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  var cinema = dummyCinemas[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: AppSizes.defaultMargin),
                        child: Text(
                          dummyCinemas[index].name,
                          style: AppTextStyle.largeText,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ListView.builder(
                          itemCount: controller.times.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            var time = controller.times[index];
                            return InkWell(
                              onTap: () => controller.selectCinema(
                                cinema,
                                controller.times[index],
                              ),
                              child: Obx(
                                () => Container(
                                  width: 90,
                                  height: 50,
                                  margin: EdgeInsets.only(
                                    left: index == 0
                                        ? AppSizes.defaultMargin
                                        : 16,
                                    right: index == controller.times.length - 1
                                        ? AppSizes.defaultMargin
                                        : 0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: controller.selectedCinemaId.value ==
                                                cinema.id &&
                                            controller.selectedTime.value ==
                                                time
                                        ? AppColors.yellowColor
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                        color: AppColors.greyColor, width: 1),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        time,
                                        style: AppTextStyle.currencySmallText
                                            .copyWith(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(
                () => InkWell(
                  onTap: () => controller.isCanNextStep.value
                      ? Get.toNamed('/selectSeat', arguments: {
                          'movie': Get.arguments['movie'],
                          'date': controller.selectedDate,
                          'cinema': controller.selectedCinema,
                          'time': controller.selectedTime,
                        })
                      : () {},
                  child: Center(
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: controller.isCanNextStep.value
                              ? AppColors.purpleColor
                              : AppColors.lightGreyColor),
                      child: Icon(
                        Icons.arrow_forward,
                        color: controller.isCanNextStep.value
                            ? Colors.white
                            : AppColors.darkGreyColor,
                        size: 30,
                      ),
                    ),
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
