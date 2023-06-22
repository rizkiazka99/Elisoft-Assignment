import 'package:elisoft_techincal_assignment/core/colors.dart';
import 'package:elisoft_techincal_assignment/core/font_sizes.dart';
import 'package:elisoft_techincal_assignment/modules/views/widgets/authentication_form.dart';
import 'package:elisoft_techincal_assignment/modules/views/widgets/default_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Container(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Text(
                    'My APPS',
                    style: h1(color: primaryColor),
                  ),
                  Image.asset(
                    'assets/images/login_illustration.jpg'
                  ),
                  const AuthenticationForm(
                    label: 'E-mail'
                  ),
                  const SizedBox(height: 15),
                  AuthenticationForm(
                    label: 'Password',
                    suffixIcon: IconButton(
                      onPressed: () {

                      },
                      icon: const Icon(
                        Icons.visibility,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 35),
                  DefaultButton(
                    onTap: () {
                      
                    },
                    buttonText: 'LOGIN'
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}