import 'package:elisoft_techincal_assignment/core/colors.dart';
import 'package:elisoft_techincal_assignment/data/api/repository.dart';
import 'package:elisoft_techincal_assignment/data/local/storage_repository.dart';
import 'package:elisoft_techincal_assignment/modules/controllers/auth/login_state.dart';
import 'package:elisoft_techincal_assignment/modules/models/common/user_model.dart';
import 'package:elisoft_techincal_assignment/modules/models/login_response.dart';
import 'package:elisoft_techincal_assignment/router/route_variables.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class LoginCubit extends Cubit<LoginState> {
  final Repository repository;
  StorageRepository storageRepository;

  LoginCubit({ 
    required this.repository,
    required this.storageRepository
  }) : super(InitialState());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final emailFormKey = GlobalKey<FormState>();
  final passwordFormKey = GlobalKey<FormState>();

  var autoValidateEmail = AutovalidateMode.disabled;
  var autoValidatePassword = AutovalidateMode.disabled;

  Future saveUserData(LoginResponse loginResponse) async {
    User user = User.fromJson(loginResponse.user.toJson());
    await storageRepository.saveUserData(user);
  }

  void signIn() async {
    dynamic data = {
      'email': emailController.text,
      'password': passwordController.text
    };
    final isEmailValid = emailFormKey.currentState!.validate();
    final isPasswordValid = passwordFormKey.currentState!.validate();

    if (isEmailValid && isPasswordValid) {
      Get.dialog(
        const SpinKitRing(color: primaryColor)
      );
      LoginResponse login = await repository.login(data);

      if (login.code == 200 && login.status == true) {
        await saveUserData(login);
        Get.back();
        Get.offAllNamed(homeScreenRoute);
        emit(SuccessState());
      } else {
        Get.back();
        emit(ErrorState());
      }
    } else if (!isEmailValid) {
      autoValidateEmail = AutovalidateMode.always;
    } else if (!isPasswordValid) {
      autoValidatePassword = AutovalidateMode.always;
    } else {
      autoValidateEmail = AutovalidateMode.always;
      autoValidatePassword = AutovalidateMode.always;
    }
    
  }
}