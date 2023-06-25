import 'package:elisoft_techincal_assignment/modules/models/article_response.dart';
import 'package:equatable/equatable.dart';

abstract class ArticlesState extends Equatable {}

class InitialState extends ArticlesState {
  @override
  List<Object> get props => [];
}

class LoadingState extends ArticlesState {
  @override
  List<Object> get props => [];
}

class ErrorState extends ArticlesState {
  @override
  List<Object> get props => [];
}

class LoadedState extends ArticlesState {
  final ArticleResponse articles;

  LoadedState(this.articles);

  @override
  List<Object> get props => [articles];
}