import 'package:VultrDash/api/api.dart';
import 'package:VultrDash/api/model/os.dart';

class OS extends API {
  Future<OSsModel> getInfo() {
    return this.Get("/os", null).then((value) => OSsModel.fromJson(value));
  }
}
