import 'package:flutix/controllers/select_genre_page_controller.dart';
import 'package:flutix/screens/widgets/button_next.dart';
import 'package:flutix/screens/widgets/header_title.dart';
import 'package:flutix/screens/widgets/textbox_widget.dart';
import 'package:flutix/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectGenrePage extends StatelessWidget {
  const SelectGenrePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SelectGenrePageController>();

    final List<String> genres = [
      'Horror',
      'Music',
      'Action',
      'Drama',
      'War',
      'Crime',
    ];

    final List<String> languages = [
      'Bahasa',
      'English',
      'Japanese',
      'Korean',
    ];

    var phoneWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderTitle(
            backFunction: Get.back,
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select Your\nFavorite Genre',
                  style: largeText.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: phoneWidth - 2 * defaultMargin,
                  child: Obx(
                    () => Wrap(
                      direction: Axis.horizontal,
                      spacing: 24,
                      runSpacing: 24,
                      children: genres
                          .map(
                            (e) => InkWell(
                              onTap: () => controller.addSelectedGenre(e),
                              child: TextBoxWidget(
                                width: phoneWidth / 2 - 38,
                                height: 60,
                                color: controller.selectedGenres.contains(e)
                                    ? yellowColor
                                    : Colors.transparent,
                                text: e,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Movie Language\nYou Prefer?',
                  style: largeText.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: phoneWidth - 2 * defaultMargin,
                  child: Obx(
                    () => Wrap(
                      direction: Axis.horizontal,
                      spacing: 24,
                      runSpacing: 24,
                      children: languages
                          .map(
                            (e) => InkWell(
                              onTap: () => controller.selectLanguage(e),
                              child: TextBoxWidget(
                                  width: phoneWidth / 2 - 38,
                                  height: 60,
                                  color: controller.selectedLang.value == e
                                      ? yellowColor
                                      : Colors.transparent,
                                  text: e),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Obx(
                  () => InkWell(
                    onTap: () => controller.isCanSignUp.value
                        ? Get.toNamed('/confirmAccount')
                        : () {},
                    child: ButtonNext(
                      arrowColor: controller.isCanSignUp.value
                          ? Colors.white
                          : darkGreyColor,
                      backgroundColor: controller.isCanSignUp.value
                          ? purpleColor
                          : lightGreyColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    )));
  }
}
