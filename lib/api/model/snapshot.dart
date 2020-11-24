import 'common.dart';
import 'dart:ffi';

class SnapshotsModel {
  List<SnapshotModel> snapshots;
  MetaModel meta;

  SnapshotsModel.fromJson(Map<String, dynamic> json)
    : snapshots = (json['snapshots'] as List).map((e) => SnapshotModel.fromJson(e)).toList(),
      meta = MetaModel.fromJson(json['meta']);

  Map<String, dynamic> toJson() => {
    "snapshots": snapshots,
    "meta": meta
  };
}

class SnapshotModel {
  String id;
  String dateCreated;
  String description;
  Uint32 size;
  String status;
  int OSID;
  int APPID;

  SnapshotModel.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      dateCreated = json['date_created'],
      description = json['description'],
      size = json['size'],
      status = json['status'],
      OSID = json['OSID'],
      APPID = json['APPID'];

  Map<String, dynamic> toJson() => {
    "id": id,
    "date_created": dateCreated,
    "description": description,
    "size": size,
    "status": status,
    "OSID": OSID,
    "APPID": APPID
  };
}

