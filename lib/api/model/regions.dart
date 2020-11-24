import 'common.dart';
import 'dart:ffi';

class RegionsModel {
  List<RegionModel> regions;
  MetaModel meta;

  RegionsModel.fromJson(Map<String, dynamic> json)
    : regions = (json['regions'] as List).map((e) => RegionModel.fromJson(e)).toList(),
      meta = MetaModel.fromJson(json['meta']);

  Map<String, dynamic> toJson() => {
    "regions": regions,
    "meta": meta
  };
}

class RegionModel {
  String id;
  String city;
  String country;
  String continent;
  Map<String, String> options;

  RegionModel.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      city = json['city'],
      country = json['country'],
      continent = json['continent'],
      options = Map<String, String>.from(json['options']);

  Map<String, dynamic> toJson() => {
    "id": id,
    "city": city,
    "country": country,
    "continent": continent,
    "options": options
  };
}

