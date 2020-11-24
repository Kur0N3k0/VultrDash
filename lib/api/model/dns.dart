import 'common.dart';
import 'dart:ffi';

class DomainsModel {
  List<DomainModel> domains;
  MetaModel meta;

  DomainsModel.fromJson(Map<String, dynamic> json)
    : domains = (json['domains'] as List).map((e) => DomainModel.fromJson(e)).toList(),
      meta = MetaModel.fromJson(json['meta']);

  Map<String, dynamic> toJson() => {
    "domains": domains,
    "meta": meta
  };
}

class DomainModel {
  String domain;
  String dateCreated;

  DomainModel.fromJson(Map<String, dynamic> json)
    : domain = json['domain'],
      dateCreated = json['date_created'];

  Map<String, dynamic> toJson() => {
    "domain": domain,
    "date_created": dateCreated
  };
}

class CreateDomainModel {
  String domain;
  String ip;
  String dnsSec;

  CreateDomainModel.fromJson(Map<String, dynamic> json)
    : domain = json['domain'],
      ip = json['ip'],
      dnsSec = json['dns_sec'];

  Map<String, dynamic> toJson() => {
    "domain": domain,
    "ip": ip,
    "dns_sec": dnsSec
  };
}

class DomainSOAModel {
  String nsprimary;
  String email;

  DomainSOAModel.fromJson(Map<String, dynamic> json)
    : nsprimary = json['nsprimary'],
      email = json['email'];

  Map<String, dynamic> toJson() => {
    "nsprimary": nsprimary,
    "email": email
  };
}

class UpdateDomainSOAModel {
  String nsprimary;
  String email;

  UpdateDomainSOAModel.fromJson(Map<String, dynamic> json)
    : nsprimary = json['nsprimary'],
      email = json['email'];

  Map<String, dynamic> toJson() => {
    "nsprimary": nsprimary,
    "email": email
  };
}

class DomainSecsModel {
  List<String> dnsSec;

  DomainSecsModel.fromJson(Map<String, dynamic> json)
    : dnsSec = new List<String>.from(json['dns_sec']);

  Map<String, dynamic> toJson() => {
    "dns_sec": dnsSec
  };
}

class CreateDomainRecordModel {
  String name;
  String type;
  String data;
  int ttl;
  int prioirty;

  CreateDomainRecordModel.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      type = json['type'],
      data = json['data'],
      ttl = json['ttl'],
      prioirty = json['prioirty'];

  Map<String, dynamic> toJson() => {
    "name": name,
    "type": type,
    "data": data,
    "ttl": ttl,
    "prioirty": prioirty
  };
}

class DomainRecordModel {
  String id;
  String type;
  String name;
  String data;
  int priority;
  int ttl;

  DomainRecordModel.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      type = json['type'],
      name = json['name'],
      data = json['data'],
      priority = json['priority'],
      ttl = json['ttl'];

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "name": name,
    "data": data,
    "priority": priority,
    "ttl": ttl
  };
}

class DomainRecordsModel {
  List<DomainRecordModel> records;
  MetaModel meta;

  DomainRecordsModel.fromJson(Map<String, dynamic> json)
    : records = (json['records'] as List).map((e) => DomainRecordModel.fromJson(e)).toList(),
      meta = MetaModel.fromJson(json['meta']);

  Map<String, dynamic> toJson() => {
    "records": records,
    "meta": meta
  };
}

class UpdateDomainRecordModel {
  String name;
  String data;
  int ttl;
  int priority;

  UpdateDomainRecordModel.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      data = json['data'],
      ttl = json['ttl'],
      priority = json['priority'];

  Map<String, dynamic> toJson() => {
    "name": name,
    "data": data,
    "ttl": ttl,
    "priority": priority
  };
}

