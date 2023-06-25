import 'package:flutter_bloc/flutter_bloc.dart';

class ObscurePasswordCubit extends Cubit<bool> {
  ObscurePasswordCubit() : super(true);

  void showPassword() {
    bool obscure = true;
  
    if (obscure == true) {
      obscure = false;
    }

    emit(obscure);
  }

  void hidePassword() {
    bool obscure = false;

    if (obscure == false) {
      obscure = true;
    }

    emit(obscure);
  }
}