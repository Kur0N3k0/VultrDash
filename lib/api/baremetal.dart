import 'package:VultrDash/api/api.dart';
import 'package:VultrDash/api/model/baremetal.dart';

class BareMetal extends API {
  Future<BareMetalsModel> getInfo() {
    return this
        .Get("/bare-metals", null)
        .then((value) => BareMetalsModel.fromJson(value));
  }

  Future<BareMetalModel> createInstance(CreateBareMetalInstanceModel param) {
    return this
        .Post("/bare-metals", null, param.toJson())
        .then((value) => BareMetalModel.fromJson(value["baremetal"]));
  }

  Future<BareMetalModel> getBareMetal(String baremetalId) {
    return this
        .Get("/bare-metals/$baremetalId", null)
        .then((value) => BareMetalModel.fromJson(value["bare_metal"]));
  }

  Future<BareMetalModel> updateBareMetal(
      String baremetalId, UpdateBareMetalModel param) {
    return this
        .Patch("/bare-metals/$baremetalId", null, param.toJson())
        .then((value) => BareMetalModel.fromJson(value["baremetal"]));
  }

  Future deleteBareMetal(String baremetalId) {
    return this.Delete("/bare-metals/$baremetalId", null, null);
  }
}
