import 'common.dart';
import 'dart:ffi';

class BackupsModel {
  List<BackupModel> backups;
  MetaModel meta;

  BackupsModel.fromJson(Map<String, dynamic> json)
      : backups = (json['backups'] as List).map((e) => BackupModel.fromJson(e)),
        meta = MetaModel.fromJson(json['backups']);

  Map<String, dynamic> toJson() => {"backups": backups, "meta": meta};
}

class BackupModel {
  String id;
  String dateCreated;
  String description;
  int size;
  String status;

  BackupModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        dateCreated = json['date_created'],
        description = json['description'],
        size = json['size'],
        status = json['status'];

  Map<String, dynamic> toJson() => {
        "id": id,
        "date_created": dateCreated,
        "description": description,
        "size": size,
        "status": status
      };
}
