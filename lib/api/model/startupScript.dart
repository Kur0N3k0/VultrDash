import 'common.dart';
import 'dart:ffi';

class StartupScriptsModel {
  List<StartupScriptModel> startupScripts;
  MetaModel meta;

  StartupScriptsModel.fromJson(Map<String, dynamic> json)
    : startupScripts = (json['startup_scripts'] as List).map((e) => StartupScriptModel.fromJson(e)),
      meta = MetaModel.fromJson(json['startup_scripts']);

  Map<String, dynamic> toJson() => {
    "startup_scripts": startupScripts,
    "meta": meta
  };
}

class StartupScriptModel {
  String id;
  String dateCreated;
  String dateModified;
  String name;
  String type;
  String script;

  StartupScriptModel.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      dateCreated = json['date_created'],
      dateModified = json['date_modified'],
      name = json['name'],
      type = json['type'],
      script = json['script'];

  Map<String, dynamic> toJson() => {
    "id": id,
    "date_created": dateCreated,
    "date_modified": dateModified,
    "name": name,
    "type": type,
    "script": script
  };
}

