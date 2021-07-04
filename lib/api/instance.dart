import 'package:VultrDash/api/api.dart';
import 'package:VultrDash/api/model/common.dart';
import 'package:VultrDash/api/model/instance.dart';

class Instance extends API {
  Future<InstancesModel> getInfo({Map<String, dynamic> param}) {
    return this
        .Get("/instances", param)
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

  Future<BackupScheduleInstanceModel> setBackupSchedule(
      String instanceId, SetBackupScheduleInstanceModel param) {
    return this
        .Post("/instances/$instanceId/backup-schedule", null, param.toJson())
        .then((value) =>
            BackupScheduleInstanceModel.fromJson(value["backup_schedule"]));
  }

  Future<BackupScheduleInstanceModel> getBackupSchedule(String instanceId) {
    return this.Get("/instances/$instanceId/backup-schedule", null).then(
        (value) =>
            BackupScheduleInstanceModel.fromJson(value["backup_schedule"]));
  }

  Future<RestoreInstanceStatusModel> restoreInstance(
      String instanceId, String backupId, String snapshotId) {
    return this.Post("/instances/$instanceId/backup-schedule", null, {
      "backup_id": backupId,
      "snapshot_id": snapshotId
    }).then((value) => RestoreInstanceStatusModel.fromJson(value["status"]));
  }

  Future<IPv4sInstanceModel> getIPv4s(String instanceId) {
    return this
        .Get("/instances/$instanceId/ipv4", null)
        .then((value) => IPv4sInstanceModel.fromJson(value));
  }

  Future<IPv4InstanceModel> createIPv4(String instanceId, bool reboot) {
    return this.Post("/instances/$instanceId/ipv4", null,
        {"reboot": reboot}).then((value) => IPv4InstanceModel.fromJson(value));
  }

  Future<IPv6sInstanceModel> getIPv6(String instanceId) {
    return this
        .Get("/instances/$instanceId/ipv6", null)
        .then((value) => IPv6sInstanceModel.fromJson(value));
  }

  Future createReverseIPv6(String instanceId, String ip, String reverse) {
    return this.Post("/instances/$instanceId/ipv6/reverse", null,
        {"ip": ip, "reverse": reverse});
  }

  Future<ReverseIPModel> getReverseIPv6(String instanceId) {
    return this
        .Get("/instances/$instanceId/ipv6/reverse", null)
        .then((value) => ReverseIPModel.fromJson(value));
  }

  Future createReverseIPv4(String instanceId, String ip, String reverse) {
    return this.Post("/instances/$instanceId/ipv4/reverse", null,
        {"ip": ip, "reverse": reverse});
  }

  Future halt(String instanceId) {
    return this.Post("/instances/$instanceId/halt", null, null);
  }

  Future setDefaultReverseDNSEntry(String instanceId, String ip) {
    return this
        .Post("/instances/$instanceId/ipv4/reverse/default", null, {"ip": ip});
  }

  Future deleteIPv4(String instanceId, String ipv4) {
    return this.Delete("/instances/$instanceId/ipv4/$ipv4", null, null);
  }

  Future deleteIPv6(String instanceId, String ipv6) {
    return this.Delete("/instances/$instanceId/ipv6/$ipv6", null, null);
  }
}
