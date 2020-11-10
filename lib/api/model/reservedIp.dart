import 'common.dart';
import 'dart:ffi';

class ReservedIPsModel {
  List<ReservedIPModel> reservedIps;
  MetaModel meta;

  ReservedIPsModel.fromJson(Map<String, dynamic> json)
      : reservedIps = (json['reserved_ips'] as List)
            .map((e) => ReservedIPModel.fromJson(e)),
        meta = MetaModel.fromJson(json['reserved_ips']);

  Map<String, dynamic> toJson() => {"reserved_ips": reservedIps, "meta": meta};
}

class ReservedIPModel {
  String id;
  String region;
  String ipType;
  String subnet;
  int subnetSize;
  String label;
  String instanceId;

  ReservedIPModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        region = json['region'],
        ipType = json['ip_type'],
        subnet = json['subnet'],
        subnetSize = json['subnet_size'],
        label = json['label'],
        instanceId = json['instance_id'];

  Map<String, dynamic> toJson() => {
        "id": id,
        "region": region,
        "ip_type": ipType,
        "subnet": subnet,
        "subnet_size": subnetSize,
        "label": label,
        "instance_id": instanceId
      };
}

class CreateReservedIP {
  String region;
  String ipType;
  String label;

  CreateReservedIP.fromJson(Map<String, dynamic> json)
      : region = json['region'],
        ipType = json['ip_type'],
        label = json['label'];

  Map<String, dynamic> toJson() =>
      {"region": region, "ip_type": ipType, "label": label};
}
