import 'package:flutix/routes/pages.dart';
import 'package:flutix/screens/pages/login_page.dart';
import 'package:flutix/screens/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      home: const WelcomePage(),
      getPages: Pages.pages,
    );
  }
}
