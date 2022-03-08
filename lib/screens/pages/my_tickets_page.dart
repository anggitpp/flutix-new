import 'package:flutix/controllers/my_tickets_page_controller.dart';
import 'package:flutix/screens/widgets/my_tickets_widget.dart';
import 'package:flutix/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:supercharged/supercharged.dart';

class MyTicketsPage extends StatelessWidget {
  const MyTicketsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final phoneWidth = MediaQuery.of(context).size.width;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.amber, // navigation bar color
      statusBarColor: Colors.red, // status bar color
      statusBarIconBrightness: Brightness.dark, // status bar icon color
      systemNavigationBarIconBrightness:
          Brightness.dark, // color of navigation controls
    ));
    final controller = Get.find<MyTicketsPageController>();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: darkPurpleColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: phoneWidth,
                height: 134,
                decoration: BoxDecoration(
                  color: darkPurpleColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: defaultMargin),
                      child: Text(
                        'My Tickets',
                        style: largeText.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Obx(
                        () => Row(
                            children: controller.tabs
                                .map(
                                  (e) => InkWell(
                                    onTap: () => controller.selectTab(e),
                                    child: Container(
                                      width: phoneWidth / 2 - 20,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: e ==
                                                    controller.selectedTab.value
                                                ? yellowColor
                                                : Colors.transparent,
                                            width: 3,
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        e,
                                        style: mediumText.copyWith(
                                          color:
                                              e == controller.selectedTab.value
                                                  ? Colors.white
                                                  : '6F678E'.toColor(),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                )
                                .toList()),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultMargin,
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => Get.toNamed('/ticketdetail'),
                      child: MyTicketsWidget(
                        title: 'Avengers: Infinity Wars',
                        subtitle: 'CGV Paris van Java Mall',
                        language: 'English',
                        genre: 'Action',
                        imageMovie: 'avengers.jpg',
                      ),
                    ),
                    MyTicketsWidget(
                      title: 'Avengers: Infinity Wars',
                      subtitle: 'CGV Paris van Java Mall',
                      language: 'English',
                      genre: 'Action',
                      imageMovie: 'avengers.jpg',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
