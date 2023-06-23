import 'package:elisoft_techincal_assignment/modules/models/common/created_model.dart';

class User {
    String name;
    String email;
    String phoneNumber;
    Created created;
    String uuid;

    User({
        required this.name,
        required this.email,
        required this.phoneNumber,
        required this.created,
        required this.uuid,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        created: Created.fromJson(json["created"]),
        uuid: json["uuid"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone_number": phoneNumber,
        "created": created.toJson(),
        "uuid": uuid,
    };
}