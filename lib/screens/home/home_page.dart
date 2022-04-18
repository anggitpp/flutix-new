import 'package:flutix/blocs/blocs.dart';
import 'package:flutix/screens/movies/movies.dart';
import 'package:flutix/screens/tickets/tickets.dart';
import 'package:flutix/screens/home/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:supercharged/supercharged.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
          child: Stack(
            children: [
              context.watch<HomeCubit>().state.selectedPage == 'movies'
                  ? const MoviesPage()
                  : const TicketsPage(),
            ],
          ),
        ),
      ),
    );
  }
}
