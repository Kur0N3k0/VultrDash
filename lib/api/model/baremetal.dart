import 'common.dart';
import 'dart:ffi';

class BareMetalsModel {
  List<BareMetalModel> bareMetals;
  MetaModel meta;

  BareMetalsModel.fromJson(Map<String, dynamic> json)
      : bareMetals = (json['bare_metals'] as List)
            .map((e) => BareMetalModel.fromJson(e)),
        meta = MetaModel.fromJson(json['bare_metals']);

  Map<String, dynamic> toJson() => {"bare_metals": bareMetals, "meta": meta};
}

class BareMetalModel {
  String id;
  String os;
  String ram;
  String disk;
  String mainIp;
  int cpuCount;
  String region;
  String defaultPassword;
  String dateCreated;
  String status;
  String netmaskV4;
  String gatewayV4;
  String plan;
  String v6Network;
  String v6MainIp;
  int v6NetworkSize;
  String label;
  String tag;
  int osId;
  int appId;

  BareMetalModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        os = json['os'],
        ram = json['ram'],
        disk = json['disk'],
        mainIp = json['main_ip'],
        cpuCount = json['cpu_count'],
        region = json['region'],
        defaultPassword = json['default_password'],
        dateCreated = json['date_created'],
        status = json['status'],
        netmaskV4 = json['netmask_v4'],
        gatewayV4 = json['gateway_v4'],
        plan = json['plan'],
        v6Network = json['v6_network'],
        v6MainIp = json['v6_main_ip'],
        v6NetworkSize = json['v6_network_size'],
        label = json['label'],
        tag = json['tag'],
        osId = json['os_id'],
        appId = json['app_id'];

  Map<String, dynamic> toJson() => {
        "id": id,
        "os": os,
        "ram": ram,
        "disk": disk,
        "main_ip": mainIp,
        "cpu_count": cpuCount,
        "region": region,
        "default_password": defaultPassword,
        "date_created": dateCreated,
        "status": status,
        "netmask_v4": netmaskV4,
        "gateway_v4": gatewayV4,
        "plan": plan,
        "v6_network": v6Network,
        "v6_main_ip": v6MainIp,
        "v6_network_size": v6NetworkSize,
        "label": label,
        "tag": tag,
        "os_id": osId,
        "app_id": appId
      };
}

class CreateBareMetalInstanceModel {
  String region;
  String plan;
  String scriptId;
  bool enableIpv6;
  String sshkeyId;
  String userData;
  String label;
  bool activationEmail;
  String hostname;
  String tag;
  String reservedIpv4;
  int osId;
  String snapshotId;
  int appId;

  CreateBareMetalInstanceModel.fromJson(Map<String, dynamic> json)
      : region = json['region'],
        plan = json['plan'],
        scriptId = json['script_id'],
        enableIpv6 = json['enable_ipv6'],
        sshkeyId = json['sshkey_id'],
        userData = json['user_data'],
        label = json['label'],
        activationEmail = json['activation_email'],
        hostname = json['hostname'],
        tag = json['tag'],
        reservedIpv4 = json['reserved_ipv4'],
        osId = json['os_id'],
        snapshotId = json['snapshot_id'],
        appId = json['app_id'];

  Map<String, dynamic> toJson() => {
        "region": region,
        "plan": plan,
        "script_id": scriptId,
        "enable_ipv6": enableIpv6,
        "sshkey_id": sshkeyId,
        "user_data": userData,
        "label": label,
        "activation_email": activationEmail,
        "hostname": hostname,
        "tag": tag,
        "reserved_ipv4": reservedIpv4,
        "os_id": osId,
        "snapshot_id": snapshotId,
        "app_id": appId
      };
}

class UpdateBareMetalModel {
  String userData;
  String label;
  String tag;
  int osId;
  int appId;
  bool enableIpv6;

  UpdateBareMetalModel.fromJson(Map<String, dynamic> json)
      : userData = json['user_data'],
        label = json['label'],
        tag = json['tag'],
        osId = json['os_id'],
        appId = json['app_id'],
        enableIpv6 = json['enable_ipv6'];

  Map<String, dynamic> toJson() => {
        "user_data": userData,
        "label": label,
        "tag": tag,
        "os_id": osId,
        "app_id": appId,
        "enable_ipv6": enableIpv6
      };
}

class IPv4BareMetalModel {
  String ip;
  String netmask;
  String gateway;
  String type;
  String reverse;

  IPv4BareMetalModel.fromJson(Map<String, dynamic> json)
      : ip = json['ip'],
        netmask = json['netmask'],
        gateway = json['gateway'],
        type = json['type'],
        reverse = json['reverse'];

  Map<String, dynamic> toJson() => {
        "ip": ip,
        "netmask": netmask,
        "gateway": gateway,
        "type": type,
        "reverse": reverse
      };
}

class IPv6BareMetalModel {
  String ip;
  String netmask;
  int networkSize;
  String type;

  IPv6BareMetalModel.fromJson(Map<String, dynamic> json)
      : ip = json['ip'],
        netmask = json['netmask'],
        networkSize = json['network_size'],
        type = json['type'];

  Map<String, dynamic> toJson() =>
      {"ip": ip, "netmask": netmask, "network_size": networkSize, "type": type};
}
