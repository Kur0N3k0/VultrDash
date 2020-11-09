import 'package:VultrDash/api/api.dart';
import 'package:VultrDash/api/model/app.dart';

class App extends API {
  Future<AppsModel> getInfo() {
    return this.Get("/applications", null).then((value) => AppsModel.fromJson(value));
  }
}