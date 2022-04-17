import 'package:flutix/controllers/home_page_controller.dart';
import 'package:flutix/screens/pages/movies_page.dart';
import 'package:flutix/screens/pages/tickets_page.dart';
import 'package:flutix/screens/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:supercharged/supercharged.dart';

import '../../config/theme.dart';

class HomePage extends StatelessWidget {
  final controller = Get.find<HomePageController>();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: darkPurpleColor,
    //   statusBarBrightness: Brightness.dark,
    //   statusBarIconBrightness: Brightness.dark, // status bar icon color
    //   systemNavigationBarIconBrightness:
    //       Brightness.dark, // color of navigation controls
    // ));

    return Scaffold(
      backgroundColor: 'F6F7F9'.toColor(),
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.darkPurpleColor,
          statusBarIconBrightness: Brightness.light, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
      ),
      floatingActionButton: Align(
        alignment: const Alignment(0.1, 1.08),
        child: FloatingActionButton(
          onPressed: () => Get.toNamed('/topup'),
          backgroundColor: AppColors.yellowColor,
          child: Icon(
            Icons.download,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(
            () => Stack(
              children: [
                controller.selectedPage.value == 'movies'
                    ? const MoviesPage()
                    : const TicketsPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
