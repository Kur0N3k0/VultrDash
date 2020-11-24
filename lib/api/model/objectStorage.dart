import 'common.dart';
import 'dart:ffi';

class ObjectStoragesModel {
  List<ObjectStorageModel> objectStorages;
  MetaModel meta;

  ObjectStoragesModel.fromJson(Map<String, dynamic> json)
    : objectStorages = (json['object_storages'] as List).map((e) => ObjectStorageModel.fromJson(e)).toList(),
      meta = MetaModel.fromJson(json['meta']);

  Map<String, dynamic> toJson() => {
    "object_storages": objectStorages,
    "meta": meta
  };
}

class ObjectStorageModel {
  String id;
  String dateCreated;
  int clusterId;
  String region;
  String label;
  String status;
  String s3Hostname;
  String s3AccessKey;
  String s3SecretKey;

  ObjectStorageModel.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      dateCreated = json['date_created'],
      clusterId = json['cluster_id'],
      region = json['region'],
      label = json['label'],
      status = json['status'],
      s3Hostname = json['s3_hostname'],
      s3AccessKey = json['s3_access_key'],
      s3SecretKey = json['s3_secret_key'];

  Map<String, dynamic> toJson() => {
    "id": id,
    "date_created": dateCreated,
    "cluster_id": clusterId,
    "region": region,
    "label": label,
    "status": status,
    "s3_hostname": s3Hostname,
    "s3_access_key": s3AccessKey,
    "s3_secret_key": s3SecretKey
  };
}

class CreateObjectStorageModel {
  int clusterId;
  String label;

  CreateObjectStorageModel.fromJson(Map<String, dynamic> json)
    : clusterId = json['cluster_id'],
      label = json['label'];

  Map<String, dynamic> toJson() => {
    "cluster_id": clusterId,
    "label": label
  };
}

class ObjectStroageS3CredentialModel {
  String s3Hostname;
  String s3AccessKey;
  String s3SecretKey;

  ObjectStroageS3CredentialModel.fromJson(Map<String, dynamic> json)
    : s3Hostname = json['s3_hostname'],
      s3AccessKey = json['s3_access_key'],
      s3SecretKey = json['s3_secret_key'];

  Map<String, dynamic> toJson() => {
    "s3_hostname": s3Hostname,
    "s3_access_key": s3AccessKey,
    "s3_secret_key": s3SecretKey
  };
}

class ObjectStorageClustersModel {
  List<ObjectStorageClusterModel> clusters;
  MetaModel meta;

  ObjectStorageClustersModel.fromJson(Map<String, dynamic> json)
    : clusters = (json['clusters'] as List).map((e) => ObjectStorageClusterModel.fromJson(e)).toList(),
      meta = MetaModel.fromJson(json['meta']);

  Map<String, dynamic> toJson() => {
    "clusters": clusters,
    "meta": meta
  };
}

class ObjectStorageClusterModel {
  String id;
  String region;
  String hostname;
  String deploy;

  ObjectStorageClusterModel.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      region = json['region'],
      hostname = json['hostname'],
      deploy = json['deploy'];

  Map<String, dynamic> toJson() => {
    "id": id,
    "region": region,
    "hostname": hostname,
    "deploy": deploy
  };
}

