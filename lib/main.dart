import 'package:elisoft_techincal_assignment/core/colors.dart';
import 'package:elisoft_techincal_assignment/router/route_variables.dart';
import 'package:elisoft_techincal_assignment/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown
      ]
    );

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Elisoft Technical Assignment',
      theme: ThemeData(
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        colorSchemeSeed: primaryColor,
        useMaterial3: true,
      ),
      getPages: AppPages.pages,
      initialRoute: homeScreenRoute,
    );
  }
}

