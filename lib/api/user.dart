import 'package:VultrDash/api/api.dart';
import 'package:VultrDash/api/model/user.dart';

class User extends API {
  Future<UsersModel> getInfo() {
    return this.Get("/users", null).then((value) => UsersModel.fromJson(value));
  }

  Future<UserModel> getUser(String userId) {
    return this
        .Get("/users/$userId", null)
        .then((value) => UserModel.fromJson(value["user"]));
  }
}
