import 'package:flutix/config/route_name.dart';
import 'package:flutix/screens/login/login.dart';
import 'package:flutix/screens/registration/registration.dart';
import 'package:flutix/screens/welcome/welcome.dart';

final pages = {
  RouteName.welcome: (context) => const WelcomePage(),
  RouteName.registration: (context) => const RegistrationPage(),
  RouteName.login: (context) => const LoginPage(),
};
