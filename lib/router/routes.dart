import 'package:get/get.dart';
import 'package:elisoft_techincal_assignment/router/route_variables.dart';
import 'package:elisoft_techincal_assignment/modules/views/pages/login_screen.dart';
import 'package:elisoft_techincal_assignment/modules/views/pages/home_screen.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: loginScreenRoute, 
      page: () => const LoginScreen()
    ),
    GetPage(
      name: homeScreenRoute, 
      page: () => const HomeScreen()
    )
  ];
}