import 'package:elisoft_techincal_assignment/modules/models/common/user_model.dart';

class LoginResponse {
    int code;
    bool status;
    String message;
    User user;

    LoginResponse({
        required this.code,
        required this.status,
        required this.message,
        required this.user,
    });

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "user": user.toJson(),
    };
}
