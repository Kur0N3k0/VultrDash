import 'common.dart';
import 'dart:ffi';

class OSsModel {
  List<OSModel> os;
  MetaModel meta;

  OSsModel.fromJson(Map<String, dynamic> json)
    : os = (json['os'] as List).map((e) => OSModel.fromJson(e)),
      meta = MetaModel.fromJson(json['os']);

  Map<String, dynamic> toJson() => {
    "os": os,
    "meta": meta
  };
}

class OSModel {
  int id;
  String name;
  String arch;
  String family;

  OSModel.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      name = json['name'],
      arch = json['arch'],
      family = json['family'];

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "arch": arch,
    "family": family
  };
}

