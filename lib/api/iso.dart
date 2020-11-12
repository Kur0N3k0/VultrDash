import 'package:VultrDash/api/api.dart';
import 'package:VultrDash/api/model/iso.dart';

class ISO extends API {
  Future<ISOsModel> getInfo() {
    return this.Get("/iso", null).then((value) => ISOsModel.fromJson(value));
  }

  Future<ISOModel> createISO(String url) {
    return this.Post("/iso", null, {"url": url}).then(
        (value) => ISOModel.fromJson(value["iso"]));
  }

  Future<ISOModel> getISO(String isoId) {
    return this
        .Get("/iso/$isoId", null)
        .then((value) => ISOModel.fromJson(value["iso"]));
  }

  Future deleteISO(String isoId) {
    return this.Delete("/iso/$isoId/delete", null, null);
  }

  Future<PublicISOsModel> getPublicISO() {
    return this
        .Get("/iso-public", null)
        .then((value) => PublicISOsModel.fromJson(value));
  }
}
