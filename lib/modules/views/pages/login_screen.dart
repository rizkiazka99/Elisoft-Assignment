import 'package:elisoft_techincal_assignment/core/colors.dart';
import 'package:elisoft_techincal_assignment/core/font_sizes.dart';
import 'package:elisoft_techincal_assignment/data/api/repository.dart';
import 'package:elisoft_techincal_assignment/data/local/storage_repository.dart';
import 'package:elisoft_techincal_assignment/modules/controllers/auth/login_cubit.dart';
import 'package:elisoft_techincal_assignment/modules/controllers/auth/login_state.dart';
import 'package:elisoft_techincal_assignment/modules/controllers/auth/obscure_password_cubit.dart';
import 'package:elisoft_techincal_assignment/modules/views/widgets/authentication_form.dart';
import 'package:elisoft_techincal_assignment/modules/views/widgets/default_button.dart';
import 'package:elisoft_techincal_assignment/modules/views/widgets/default_snackbar.dart';
import 'package:elisoft_techincal_assignment/router/route_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
        repository: Repository(), 
        storageRepository: StorageRepository()
      ),
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  if (state is ErrorState) {
                    defaultSnackbar('Oops!', 'Login failed, please try again');
                    return const SizedBox.shrink();
                  } else if (state is SuccessState) {
                    Get.offAllNamed(loginScreenRoute);
                    return const SizedBox.shrink();
                  } else {
                    return SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Text(
                            'My APPS',
                            style: h1(color: primaryColor),
                          ),
                          Image.asset('assets/images/login_illustration.jpg'),
                          AuthenticationForm(
                            formKey: context.read<LoginCubit>().emailFormKey,
                            controller: context.read<LoginCubit>().emailController,
                            autovalidateMode: context.read<LoginCubit>().autoValidateEmail,
                            label: 'E-mail',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'E-mail field cannot be left empty';
                              }
                            },
                          ),
                          const SizedBox(height: 15),
                          BlocProvider(
                            create: (context) => ObscurePasswordCubit(),
                            child: BlocBuilder<ObscurePasswordCubit, bool>(
                              builder: (context, state) {
                                return AuthenticationForm(
                                  formKey: context.read<LoginCubit>().passwordFormKey,
                                  controller: context.read<LoginCubit>().passwordController,
                                  autovalidateMode: context.read<LoginCubit>().autoValidatePassword,
                                  label: 'Password',
                                  obscureText: state,
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      state
                                          ? context
                                              .read<ObscurePasswordCubit>()
                                              .showPassword()
                                          : context
                                              .read<ObscurePasswordCubit>()
                                              .hidePassword();
                                    },
                                    icon: Icon(
                                      state
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: primaryColor,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Password field cannot be left empty';
                                    }
                                  },
                                );
                              },
                            )),
                          const SizedBox(height: 35),
                          DefaultButton(
                            onTap: () {
                              context.read<LoginCubit>().signIn();
                            }, 
                            buttonText: 'LOGIN'
                          )
                        ],
                      ),
                    );
                  }
                }
              ),
            ),
          ),
        ),
      ),
    );
  }
}