import 'package:VultrDash/api/api.dart';
import 'package:VultrDash/api/model/regions.dart';

class Region extends API {
  Future<RegionsModel> getInfo() {
    return this
        .Get("/regions", null)
        .then((value) => RegionsModel.fromJson(value));
  }

  Future<List<String>> getAvailableComputeRegion(String regionId) {
    return this
        .Get("/regions/$regionId/availability", null)
        .then((value) => value["available_plans"] as List<String>);
  }
}
