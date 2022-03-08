import 'package:flutix/controllers/home_page_controller.dart';
import 'package:flutix/screens/pages/movies_page.dart';
import 'package:flutix/screens/pages/tickets_page.dart';
import 'package:flutix/screens/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutix/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:supercharged/supercharged.dart';

class HomePage extends StatelessWidget {
  final controller = Get.find<HomePageController>();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.amber, // navigation bar color
      statusBarColor: Colors.red, // status bar color
      statusBarIconBrightness: Brightness.dark, // status bar icon color
      systemNavigationBarIconBrightness:
          Brightness.dark, // color of navigation controls
    ));

    return Scaffold(
      backgroundColor: 'F6F7F9'.toColor(),
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: darkPurpleColor,
        elevation: 0,
      ),
      floatingActionButton: Align(
        alignment: Alignment(0.1, 1.08),
        child: FloatingActionButton(
          onPressed: () => Get.toNamed('/topup'),
          backgroundColor: yellowColor,
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
