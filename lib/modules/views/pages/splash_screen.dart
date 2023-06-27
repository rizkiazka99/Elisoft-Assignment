import 'package:elisoft_techincal_assignment/core/colors.dart';
import 'package:elisoft_techincal_assignment/core/font_sizes.dart';
import 'package:elisoft_techincal_assignment/modules/controllers/miscellaneous/splash_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashScreenCubit(),
      child: BlocBuilder<SplashScreenCubit, dynamic>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 1.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/logo.jpg'),
                            const SizedBox(height: 8),
                            Text(
                              'TECHNICAL ASSIGNMENT',
                              style: h5(color: primaryColor),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'by',
                                  style: h6(color: primaryColor),
                                ),
                                Text(
                                  ' Rizki Azka Fihi Aghnia',
                                  style: h6(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Expanded(
                        child: Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: SizedBox(
                            height: 50,
                            child: SpinKitRipple(
                              color: primaryColor,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          );
        }
      )
    );
  }
}