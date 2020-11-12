import 'package:VultrDash/api/api.dart';
import 'package:VultrDash/api/model/objectStorage.dart';

class ObjectStorage extends API {
  Future<ObjectStoragesModel> getInfo() {
    return this
        .Get("/object-storage", null)
        .then((value) => ObjectStoragesModel.fromJson(value));
  }

  Future<ObjectStorageModel> createObjectStorage(
      CreateObjectStorageModel param) {
    return this
        .Post("/object-storage", null, param.toJson())
        .then((value) => ObjectStorageModel.fromJson(value["object_storage"]));
  }

  Future<ObjectStorageModel> getObjectStorage(String objectstorageId) {
    return this
        .Get("/object-storage/$objectstorageId", null)
        .then((value) => ObjectStorageModel.fromJson(value["object_storage"]));
  }

  Future deleteObjectStorage(String objectstorageId) {
    return this.Delete("/object-storage/$objectstorageId", null, null);
  }

  Future updateObjectStorage(String objectstorageId, String label) {
    return this.Patch("/object-storage/$objectstorageId", null, null);
  }

  Future<ObjectStroageS3CredentialModel> regenerateObjectStorageKeys(
      String objectstorageId) {
    return this
        .Post("/object-storage/$objectstorageId/regenerat-keys", null, null)
        .then((value) =>
            ObjectStroageS3CredentialModel.fromJson(value["s3_credentials"]));
  }

  Future<ObjectStorageClustersModel> getClusters() {
    return this
        .Get("/object-storage/clusters", null)
        .then((value) => ObjectStorageClustersModel.fromJson(value));
  }
}
