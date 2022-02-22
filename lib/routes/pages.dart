import 'package:flutix/bindings/home_page_binding.dart';
import 'package:flutix/routes/route_name.dart';
import 'package:flutix/screens/pages/home_page.dart';
import 'package:flutix/screens/pages/login_page.dart';
import 'package:flutix/screens/pages/welcome_page.dart';
import 'package:get/get.dart';

class Pages {
  static final pages = [
    GetPage(
      name: RouteName.welcome,
      page: () => const WelcomePage(),
    ),
    GetPage(
      name: RouteName.login,
      page: () => const LoginPage(),
    ),
    GetPage(
        name: RouteName.home,
        page: () => HomePage(),
        binding: HomePageBinding()),
  ];
}
