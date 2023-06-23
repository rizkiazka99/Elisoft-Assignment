import 'package:elisoft_techincal_assignment/data/api_endpoints.dart';
import 'package:elisoft_techincal_assignment/modules/models/login_response.dart';
import 'package:elisoft_techincal_assignment/modules/models/article_response.dart';

class Repository {
  Auth auth = Auth();
  Articles articles = Articles();

  Future<LoginResponse> login(data) async {
    final response = await auth.login(data);
    return LoginResponse.fromJson(response);
  }

  Future<ArticleResponse> getArticles() async {
    final response = await articles.getArticles();
    return ArticleResponse.fromJson(response);
  }
}