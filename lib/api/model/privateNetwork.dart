import 'common.dart';
import 'dart:ffi';

class PrivateNetworksModel {
  List<PrivateNetworkModel> networks;
  MetaModel meta;

  PrivateNetworksModel.fromJson(Map<String, dynamic> json)
      : networks = (json['networks'] as List)
            .map((e) => PrivateNetworkModel.fromJson(e)),
        meta = MetaModel.fromJson(json['networks']);

  Map<String, dynamic> toJson() => {"networks": networks, "meta": meta};
}

class PrivateNetworkModel {
  String id;
  String dateCreated;
  String region;
  String description;
  String v4Subnet;
  int v4SubnetMask;

  PrivateNetworkModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        dateCreated = json['date_created'],
        region = json['region'],
        description = json['description'],
        v4Subnet = json['v4_subnet'],
        v4SubnetMask = json['v4_subnet_mask'];

  Map<String, dynamic> toJson() => {
        "id": id,
        "date_created": dateCreated,
        "region": region,
        "description": description,
        "v4_subnet": v4Subnet,
        "v4_subnet_mask": v4SubnetMask
      };
}

class CreatePrivateNetworkModel {
  String region;
  String description;
  String v4Subnet;
  int v4SubnetMask;

  CreatePrivateNetworkModel.fromJson(Map<String, dynamic> json)
      : region = json['region'],
        description = json['description'],
        v4Subnet = json['v4_subnet'],
        v4SubnetMask = json['v4_subnet_mask'];

  Map<String, dynamic> toJson() => {
        "region": region,
        "description": description,
        "v4_subnet": v4Subnet,
        "v4_subnet_mask": v4SubnetMask
      };
}
