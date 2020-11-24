import 'common.dart';
import 'dart:ffi';

class AppsModel {
  List<AppModel> applications;
  MetaModel meta;

  AppsModel.fromJson(Map<String, dynamic> json)
    : applications = (json['applications'] as List).map((e) => AppModel.fromJson(e)).toList(),
      meta = MetaModel.fromJson(json['meta']);

  Map<String, dynamic> toJson() => {
    "applications": applications,
    "meta": meta
  };
}

class AppModel {
  int id;
  String name;
  String shortName;
  String deployName;

  AppModel.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      name = json['name'],
      shortName = json['short_name'],
      deployName = json['deploy_name'];

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "short_name": shortName,
    "deploy_name": deployName
  };
}

