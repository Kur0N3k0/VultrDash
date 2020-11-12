import 'package:VultrDash/api/api.dart';
import 'package:VultrDash/api/model/plans.dart';

class Plan extends API {
  Future<PlansModel> getInfo() {
    return this.Get("/plans", null).then((value) => PlansModel.fromJson(value));
  }

  Future<PlansModel> getBaremetalInfo() {
    return this
        .Get("/plans-metal", null)
        .then((value) => PlansModel.fromJson(value));
  }
}
