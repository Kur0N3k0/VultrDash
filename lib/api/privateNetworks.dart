import 'package:VultrDash/api/api.dart';
import 'package:VultrDash/api/model/privateNetwork.dart';

class PrivateNetwork extends API {
  Future<PrivateNetworksModel> getInfo() {
    return this
        .Get("/private-networks", null)
        .then((value) => PrivateNetworksModel.fromJson(value));
  }

  Future<PrivateNetworkModel> getPrivateNetwork(String networkId) {
    return this
        .Get("/private-networks/$networkId", null)
        .then((value) => PrivateNetworkModel.fromJson(value["network"]));
  }

  Future deletePrivateNetwork(String networkId) {
    return this.Delete("/private-networks/$networkId", null, null);
  }

  Future updatePrivateNetwork(String networkId, String description) {
    return this.Put(
        "/private-networks/$networkId", {"description": description}, null);
  }

  Future<PrivateNetworkModel> createPrivateNetwork(
      CreatePrivateNetworkModel param) {
    return this
        .Post("/private-networks", null, param.toJson())
        .then((value) => PrivateNetworkModel.fromJson(value["network"]));
  }
}
