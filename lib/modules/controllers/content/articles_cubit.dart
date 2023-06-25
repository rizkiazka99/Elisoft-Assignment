import 'package:elisoft_techincal_assignment/data/repository.dart';
import 'package:elisoft_techincal_assignment/modules/controllers/content/articles_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
}