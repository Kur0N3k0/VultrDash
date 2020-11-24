import 'common.dart';
import 'dart:ffi';

class PlansModel {
  List<PlanModel> plans;
  MetaModel meta;

  PlansModel.fromJson(Map<String, dynamic> json)
    : plans = (json['plans'] as List).map((e) => PlanModel.fromJson(e)).toList(),
      meta = MetaModel.fromJson(json['meta']);

  Map<String, dynamic> toJson() => {
    "plans": plans,
    "meta": meta
  };
}

class PlanModel {
  String id;
  int vcpuCount;
  int ram;
  int disk;
  int bandwidth;
  String monthlyCost;
  String type;
  List<String> locations;

  PlanModel.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      vcpuCount = json['vcpu_count'],
      ram = json['ram'],
      disk = json['disk'],
      bandwidth = json['bandwidth'],
      monthlyCost = json['monthly_cost'],
      type = json['type'],
      locations = new List<String>.from(json['locations']);

  Map<String, dynamic> toJson() => {
    "id": id,
    "vcpu_count": vcpuCount,
    "ram": ram,
    "disk": disk,
    "bandwidth": bandwidth,
    "monthly_cost": monthlyCost,
    "type": type,
    "locations": locations
  };
}

