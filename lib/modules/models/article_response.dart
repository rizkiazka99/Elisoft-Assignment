import 'package:elisoft_techincal_assignment/modules/models/common/created_model.dart';
import 'package:elisoft_techincal_assignment/modules/models/common/user_model.dart';

class ArticleResponse {
    int code;
    bool status;
    String message;
    List<Article> articles;

    ArticleResponse({
        required this.code,
        required this.status,
        required this.message,
        required this.articles,
    });

    factory ArticleResponse.fromJson(Map<String, dynamic> json) => ArticleResponse(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
    };
}

class Article {
    String uuid;
    String title;
    String content;
    String image;
    int views;
    Created created;
    User user;

    Article({
        required this.uuid,
        required this.title,
        required this.content,
        required this.image,
        required this.views,
        required this.created,
        required this.user,
    });

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        uuid: json["uuid"],
        title: json["title"],
        content: json["content"],
        image: json["image"],
        views: json["views"],
        created: Created.fromJson(json["created"]),
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "title": title,
        "content": content,
        "image": image,
        "views": views,
        "created": created.toJson(),
        "user": user.toJson(),
    };
}