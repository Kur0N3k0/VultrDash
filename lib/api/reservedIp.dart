import 'package:VultrDash/api/api.dart';
import 'package:VultrDash/api/model/reservedIp.dart';

class ReservedIP extends API {
  Future<ReservedIPsModel> getInfo() {
    return this
        .Get("/reserved-ips", null)
        .then((value) => ReservedIPsModel.fromJson(value));
  }

  Future<ReservedIPModel> getReservedIP(String reservedIp) {
    return this
        .Get("/reserved-ips/$reservedIp", null)
        .then((value) => ReservedIPModel.fromJson(value["reserved_ip"]));
  }

  Future deleteReservedIP(String reservedIp) {
    return this.Delete("/reserved-ips/$reservedIp", null, null);
  }

  Future<ReservedIPModel> createReservedIP(CreateReservedIPModel param) {
    return this
        .Post("/reserved-ips", null, param.toJson())
        .then((value) => ReservedIPModel.fromJson(value["reserved_ip"]));
  }

  Future attachReservedIP(String reservedIp, String instanceId) {
    return this.Post(
        "/reserved-ips/$reservedIp/attach", null, {"instance_id": instanceId});
  }

  Future detachReservedIP(String reservedIp) {
    return this.Post("/reserved-ips/$reservedIp/attach", null, null);
  }

  Future<ReservedIPModel> convertInstanceIPtoReservedIP(
      String ipAddress, String label) {
    return this.Post("/reserved-ips/convert", null, {
      "ip_address": ipAddress,
      "label": label
    }).then((value) => ReservedIPModel.fromJson(value["reserved_ip"]));
  }
}
