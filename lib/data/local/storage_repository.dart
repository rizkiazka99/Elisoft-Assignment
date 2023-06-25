import 'package:elisoft_techincal_assignment/modules/models/common/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageRepository {
  Future saveUserData(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('name', user.name);
    await prefs.setString('email', user.email);
    await prefs.setString('phone_number', user.phoneNumber);
    await prefs.setString('uuid', user.uuid);
  }

  Future<User> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? name = prefs.getString('name');
    String? email = prefs.getString('email');
    String? phoneNumber = prefs.getString('phone_number');
    String? uuid = prefs.getString('uuid');

    User user = User(
      name: name!,
      email: email!,
      phoneNumber: phoneNumber!,
      uuid: uuid!
    );
    return user;
  }
}