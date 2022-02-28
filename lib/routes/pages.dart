import 'package:flutix/bindings/confirm_account_page_binding.dart';
import 'package:flutix/bindings/home_page_binding.dart';
import 'package:flutix/bindings/login_page_binding.dart';
import 'package:flutix/bindings/registration_page_binding.dart';
import 'package:flutix/bindings/select_genre_page_binding.dart';
import 'package:flutix/routes/route_name.dart';
import 'package:flutix/screens/pages/confirm_account_page.dart';
import 'package:flutix/screens/pages/home_page.dart';
import 'package:flutix/screens/pages/login_page.dart';
import 'package:flutix/screens/pages/registration_page.dart';
import 'package:flutix/screens/pages/select_genre_page.dart';
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
      binding: LoginPageBinding(),
      page: () => const LoginPage(),
    ),
    GetPage(
      name: RouteName.registration,
      binding: RegistrationPageBinding(),
      page: () => const RegistrationPage(),
    ),
    GetPage(
      name: RouteName.genre,
      binding: SelectGenrePageBinding(),
      page: () => const SelectGenrePage(),
    ),
    GetPage(
      name: RouteName.confirmAccount,
      binding: ConfirmAccountPageBinding(),
      page: () => const ConfirmAccountPage(),
    ),
    GetPage(
        name: RouteName.home,
        page: () => HomePage(),
        binding: HomePageBinding()),
  ];
}
