import 'package:VultrDash/api/api.dart';
import 'package:VultrDash/api/model/snapshot.dart';

class Snapshot extends API {
  Future<SnapshotsModel> getInfo() {
    return this
        .Get("/snapshots", null)
        .then((value) => SnapshotsModel.fromJson(value));
  }

  Future deleteSnapshot(String snapshotId) {
    return this.Delete("/snapshots/$snapshotId", null, null);
  }

  Future<SnapshotModel> getSnapshot(String snapshotId) {
    return this
        .Get("/snapshots/$snapshotId", null)
        .then((value) => SnapshotModel.fromJson(value["snapshot"]));
  }

  Future updateSnapshot(String snapshotId, String description) {
    return this
        .Put("/snapshots/$snapshotId", null, {"description": description});
  }

  Future<SnapshotModel> createSnapshot(String instanceId, String description) {
    return this.Post("/snapshots", null, {
      "instance_id": instanceId,
      "description": description
    }).then((value) => SnapshotModel.fromJson(value["snapshot"]));
  }

  Future<SnapshotModel> createSnapshotFromURL(String url) {
    return this.Post("/snapshots/create-from-url", null, {"url": url}).then(
        (value) => SnapshotModel.fromJson(value["snapshot"]));
  }
}
