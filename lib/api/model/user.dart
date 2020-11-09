import 'common.dart';
import 'dart:ffi';

class UsersModel {
  List<UserModel> users;
  MetaModel meta;

  UsersModel.fromJson(Map<String, dynamic> json)
    : users = (json['users'] as List).map((e) => UserModel.fromJson(e)),
      meta = MetaModel.fromJson(json['users']);

  Map<String, dynamic> toJson() => {
    "users": users,
    "meta": meta
  };
}

class UserModel {
  String id;
  String email;
  bool apiEnabled;
  List<String> acls;

  UserModel.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      email = json['email'],
      apiEnabled = json['api_enabled'],
      acls = json['acls'];

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "api_enabled": apiEnabled,
    "acls": acls
  };
}

