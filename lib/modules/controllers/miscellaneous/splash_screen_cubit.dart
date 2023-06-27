import 'dart:async';

import 'package:elisoft_techincal_assignment/router/route_variables.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenCubit extends Cubit {
  SplashScreenCubit() : super(0) {
    loadingApp();
  }

  void nextDestination() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? uuid = prefs.getString('uuid');

    if (uuid == null) {
      Get.offAllNamed(loginScreenRoute);
    } else {
      Get.offAllNamed(homeScreenRoute);
    }
  }

  loadingApp() {
    return Timer(
      const Duration(seconds: 3), 
      nextDestination
    );
  }
}