import 'common.dart';
import 'dart:ffi';

class SSHKeysModel {
  List<SSHKeyModel> sshKeys;
  MetaModel meta;

  SSHKeysModel.fromJson(Map<String, dynamic> json)
      : sshKeys =
            (json['ssh_keys'] as List).map((e) => SSHKeyModel.fromJson(e)),
        meta = MetaModel.fromJson(json['ssh_keys']);

  Map<String, dynamic> toJson() => {"ssh_keys": sshKeys, "meta": meta};
}

class SSHKeyModel {
  String id;
  String dateCreated;
  String name;
  String sshKey;

  SSHKeyModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        dateCreated = json['date_created'],
        name = json['name'],
        sshKey = json['ssh_key'];

  Map<String, dynamic> toJson() =>
      {"id": id, "date_created": dateCreated, "name": name, "ssh_key": sshKey};
}
