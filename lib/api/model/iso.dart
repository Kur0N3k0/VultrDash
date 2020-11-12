import 'common.dart';
import 'dart:ffi';

class ISOsModel {
  List<ISOModel> isos;
  MetaModel meta;

  ISOsModel.fromJson(Map<String, dynamic> json)
    : isos = (json['isos'] as List).map((e) => ISOModel.fromJson(e)),
      meta = MetaModel.fromJson(json['isos']);

  Map<String, dynamic> toJson() => {
    "isos": isos,
    "meta": meta
  };
}

class ISOModel {
  String id;
  String dateCreated;
  String filename;
  int size;
  String md5sum;
  String sha512sum;
  String status;

  ISOModel.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      dateCreated = json['date_created'],
      filename = json['filename'],
      size = json['size'],
      md5sum = json['md5sum'],
      sha512sum = json['sha512sum'],
      status = json['status'];

  Map<String, dynamic> toJson() => {
    "id": id,
    "date_created": dateCreated,
    "filename": filename,
    "size": size,
    "md5sum": md5sum,
    "sha512sum": sha512sum,
    "status": status
  };
}

class PublicISOsModel {
  List<ISOModel> publicIsos;
  MetaModel meta;

  PublicISOsModel.fromJson(Map<String, dynamic> json)
    : publicIsos = (json['public_isos'] as List).map((e) => ISOModel.fromJson(e)),
      meta = MetaModel.fromJson(json['public_isos']);

  Map<String, dynamic> toJson() => {
    "public_isos": publicIsos,
    "meta": meta
  };
}

