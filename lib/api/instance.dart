import 'package:VultrDash/api/api.dart';
import 'package:VultrDash/api/model/common.dart';
import 'package:VultrDash/api/model/instance.dart';

class Instance extends API {
  Future<InstancesModel> getInfo() {
    return this
        .Get("/instances", null)
        .then((value) => InstancesModel.fromJson(value));
  }

  Future<InstanceModel> createInstance(CreateInstanceModel param) {
    return this
        .Post("/instances", null, param.toJson())
        .then((value) => InstanceModel.fromJson(value["instance"]));
  }

  Future<InstanceModel> getInstance(String instanceId) {
    return this
        .Get("/instances/$instanceId", null)
        .then((value) => InstanceModel.fromJson(value["instance"]));
  }

  Future<InstanceModel> updateInstance(
      String instanceId, UpdateInstanceModel param) {
    return this
        .Patch("/instances/$instanceId", null, param.toJson())
        .then((value) => InstanceModel.fromJson(value["instance"]));
  }

  Future deleteInstance(String instanceId) {
    return this.Delete("/instances/$instanceId", null, null);
  }

  Future haltInstances(List<String> instanceIds) {
    return this.Post("/instances/halt", null, {"instance_ids": instanceIds});
  }

  Future rebootInstances(List<String> instanceIds) {
    return this.Post("/instances/reboot", null, {"instance_ids": instanceIds});
  }

  Future startInstances(List<String> instanceIds) {
    return this.Post("/instances/start", null, {"instance_ids": instanceIds});
  }

  Future startInstance(String instanceId) {
    return this.Post("/instances/$instanceId/start", null, null);
  }

  Future rebootInstance(String instanceId) {
    return this.Post("/instances/$instanceId/reboot", null, null);
  }

  Future<InstanceModel> reinstallInstance(String instanceId, String hostname) {
    return this.Post("/instances/$instanceId/reinstall", null, {
      "hostname": hostname
    }).then((value) => InstanceModel.fromJson(value["instance"]));
  }

  Future<Map<String, BandwidthModel>> bandwidthInstance(String instanceId) {
    return this
        .Get("/instances/$instanceId", null)
        .then((value) => value as Map<String, BandwidthModel>);
  }

  Future<List<String>> getNeighbors(String instanceId) {
    return this
        .Get("/instances/$instanceId/neighbors", null)
        .then((value) => value["neighbors"]);
  }

  Future<PrivateNetworksInstanceModel> getPrivateNetworks(String instanceId) {
    return this
        .Get("/instances/$instanceId/private-networks", null)
        .then((value) => PrivateNetworksInstanceModel.fromJson(value));
  }

  Future<ISOStatusInstanceModel> getISOStatus(String instanceId) {
    return this
        .Get("/instances/$instanceId/iso", null)
        .then((value) => ISOStatusInstanceModel.fromJson(value["iso_status"]));
  }

  Future<ISOStatusInstanceModel> attachISO(String instanceId, String isoId) {
    return this.Post("/instances/$instanceId/iso/attach", null, {
      "iso_id": isoId
    }).then((value) => ISOStatusInstanceModel.fromJson(value["iso_status"]));
  }

  Future<ISOStatusInstanceModel> detachISO(String instanceId) {
    return this
        .Post("/instances/$instanceId/iso/detach", null, null)
        .then((value) => ISOStatusInstanceModel.fromJson(value["iso_status"]));
  }

  Future attachPrivateNetwork(String instanceId, String networkId) {
    return this.Post("/instances/$instanceId/private-networks/attach", null,
        {"network_id": networkId});
  }

  Future detachPrivateNetwork(String instanceId, String networkId) {
    return this.Post("/instances/$instanceId/private-networks/detach", null,
        {"network_id": networkId});
  }
}
