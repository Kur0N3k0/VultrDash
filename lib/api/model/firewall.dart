import 'common.dart';
import 'dart:ffi';

class FirewallGroupsModel {
  List<FirewallGroupModel> firewallGroups;
  MetaModel meta;

  FirewallGroupsModel.fromJson(Map<String, dynamic> json)
    : firewallGroups = (json['firewall_groups'] as List).map((e) => FirewallGroupModel.fromJson(e)),
      meta = MetaModel.fromJson(json['firewall_groups']);

  Map<String, dynamic> toJson() => {
    "firewall_groups": firewallGroups,
    "meta": meta
  };
}

class FirewallGroupModel {
  String id;
  String description;
  String dateCreated;
  String dateModified;
  int instanceCount;
  int ruleCount;
  int maxRuleCount;

  FirewallGroupModel.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      description = json['description'],
      dateCreated = json['date_created'],
      dateModified = json['date_modified'],
      instanceCount = json['instance_count'],
      ruleCount = json['rule_count'],
      maxRuleCount = json['max_rule_count'];

  Map<String, dynamic> toJson() => {
    "id": id,
    "description": description,
    "date_created": dateCreated,
    "date_modified": dateModified,
    "instance_count": instanceCount,
    "rule_count": ruleCount,
    "max_rule_count": maxRuleCount
  };
}

class FirewallRulesModel {
  List<FirewallRuleModel> firewallRules;
  MetaModel meta;

  FirewallRulesModel.fromJson(Map<String, dynamic> json)
    : firewallRules = (json['firewall_rules'] as List).map((e) => FirewallRuleModel.fromJson(e)),
      meta = MetaModel.fromJson(json['firewall_rules']);

  Map<String, dynamic> toJson() => {
    "firewall_rules": firewallRules,
    "meta": meta
  };
}

class FirewallRuleModel {
  String id;
  String ipType;
  String action;
  String protocol;
  String port;
  String subnet;
  int subnetSize;
  String source;
  String notes;

  FirewallRuleModel.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      ipType = json['ip_type'],
      action = json['action'],
      protocol = json['protocol'],
      port = json['port'],
      subnet = json['subnet'],
      subnetSize = json['subnet_size'],
      source = json['source'],
      notes = json['notes'];

  Map<String, dynamic> toJson() => {
    "id": id,
    "ip_type": ipType,
    "action": action,
    "protocol": protocol,
    "port": port,
    "subnet": subnet,
    "subnet_size": subnetSize,
    "source": source,
    "notes": notes
  };
}

class CreateFirewallRuleModel {
  String ipType;
  String protocol;
  String subnet;
  int subnetSize;
  String port;
  String source;
  String notes;

  CreateFirewallRuleModel.fromJson(Map<String, dynamic> json)
    : ipType = json['ip_type'],
      protocol = json['protocol'],
      subnet = json['subnet'],
      subnetSize = json['subnet_size'],
      port = json['port'],
      source = json['source'],
      notes = json['notes'];

  Map<String, dynamic> toJson() => {
    "ip_type": ipType,
    "protocol": protocol,
    "subnet": subnet,
    "subnet_size": subnetSize,
    "port": port,
    "source": source,
    "notes": notes
  };
}

