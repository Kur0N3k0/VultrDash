import 'package:VultrDash/api/api.dart';
import 'package:VultrDash/api/model/account.dart';

class Account extends API {
  Future<AccountModel> getInfo() {
    return this.Get("/account", null).then((value) => AccountModel.fromJson(value));
  }
}