import 'package:elisoft_techincal_assignment/data/api/repository.dart';
import 'package:elisoft_techincal_assignment/modules/controllers/content/articles_state.dart';
import 'package:elisoft_techincal_assignment/modules/views/widgets/confirmation_dialog.dart';
import 'package:elisoft_techincal_assignment/router/route_variables.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArticlesCubit extends Cubit<ArticlesState> {
  final Repository repository;

  ArticlesCubit({required this.repository}) : super(InitialState()) {
    getArticles();
  }

  void getArticles() async {
    try {
      emit(LoadingState());
      final articles = await repository.getArticles();
      emit(LoadedState(articles));
    } catch(err) {
      emit(ErrorState());
    }
  }

  void logout() {
    Get.dialog(ConfirmationDialog(
      title: 'Hold up!', 
      content: 'Are you sure you want to log out?', 
      onConfirmation: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.clear().then((value) => Get.offAllNamed(loginScreenRoute));
      }
    ));
  }
}