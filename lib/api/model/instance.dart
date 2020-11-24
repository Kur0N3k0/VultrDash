import 'common.dart';
import 'dart:ffi';

class InstancesModel {
  List<InstanceModel> instances;
  MetaModel meta;

  InstancesModel.fromJson(Map<String, dynamic> json)
    : instances = (json['instances'] as List).map((e) => InstanceModel.fromJson(e)).toList(),
      meta = MetaModel.fromJson(json['meta']);

  Map<String, dynamic> toJson() => {
    "instances": instances,
    "meta": meta
  };
}

class InstanceModel {
  String id;
  String os;
  int ram;
  int disk;
  String mainIp;
  int vcpuCount;
  String region;
  String plan;
  String dateCreated;
  String status;
  int allowedBandwidth;
  String netmaskV4;
  String gatewayV4;
  String powerStatus;
  String serverStatus;
  String v6Network;
  String v6MainIp;
  int v6NetworkSize;
  String label;
  String internalIp;
  String kvm;
  String tag;
  int osId;
  int appId;
  String firewallGroupId;
  List<String> features;

  InstanceModel.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      os = json['os'],
      ram = json['ram'],
      disk = json['disk'],
      mainIp = json['main_ip'],
      vcpuCount = json['vcpu_count'],
      region = json['region'],
      plan = json['plan'],
      dateCreated = json['date_created'],
      status = json['status'],
      allowedBandwidth = json['allowed_bandwidth'],
      netmaskV4 = json['netmask_v4'],
      gatewayV4 = json['gateway_v4'],
      powerStatus = json['power_status'],
      serverStatus = json['server_status'],
      v6Network = json['v6_network'],
      v6MainIp = json['v6_main_ip'],
      v6NetworkSize = json['v6_network_size'],
      label = json['label'],
      internalIp = json['internal_ip'],
      kvm = json['kvm'],
      tag = json['tag'],
      osId = json['os_id'],
      appId = json['app_id'],
      firewallGroupId = json['firewall_group_id'],
      features = new List<String>.from(json['features']);

  Map<String, dynamic> toJson() => {
    "id": id,
    "os": os,
    "ram": ram,
    "disk": disk,
    "main_ip": mainIp,
    "vcpu_count": vcpuCount,
    "region": region,
    "plan": plan,
    "date_created": dateCreated,
    "status": status,
    "allowed_bandwidth": allowedBandwidth,
    "netmask_v4": netmaskV4,
    "gateway_v4": gatewayV4,
    "power_status": powerStatus,
    "server_status": serverStatus,
    "v6_network": v6Network,
    "v6_main_ip": v6MainIp,
    "v6_network_size": v6NetworkSize,
    "label": label,
    "internal_ip": internalIp,
    "kvm": kvm,
    "tag": tag,
    "os_id": osId,
    "app_id": appId,
    "firewall_group_id": firewallGroupId,
    "features": features
  };
}

class CreateInstanceModel {
  String region;
  String plan;
  int osId;
  String ipxeChainUrl;
  String isoId;
  String scriptId;
  String snapshotId;
  bool enableIpv6;
  List<String> attachPrivateNetwork;
  String label;
  String sshkeyId;
  String backups;
  int appId;
  String userData;
  bool ddosProtection;
  bool activationEmail;
  String hostname;
  String tag;
  String firewallGroupId;
  String reservedIpv4;
  bool enablePrivateNetwork;

  CreateInstanceModel.fromJson(Map<String, dynamic> json)
    : region = json['region'],
      plan = json['plan'],
      osId = json['os_id'],
      ipxeChainUrl = json['ipxe_chain_url'],
      isoId = json['iso_id'],
      scriptId = json['script_id'],
      snapshotId = json['snapshot_id'],
      enableIpv6 = json['enable_ipv6'],
      attachPrivateNetwork = new List<String>.from(json['attach_private_network']),
      label = json['label'],
      sshkeyId = json['sshkey_id'],
      backups = json['backups'],
      appId = json['app_id'],
      userData = json['user_data'],
      ddosProtection = json['ddos_protection'],
      activationEmail = json['activation_email'],
      hostname = json['hostname'],
      tag = json['tag'],
      firewallGroupId = json['firewall_group_id'],
      reservedIpv4 = json['reserved_ipv4'],
      enablePrivateNetwork = json['enable_private_network'];

  Map<String, dynamic> toJson() => {
    "region": region,
    "plan": plan,
    "os_id": osId,
    "ipxe_chain_url": ipxeChainUrl,
    "iso_id": isoId,
    "script_id": scriptId,
    "snapshot_id": snapshotId,
    "enable_ipv6": enableIpv6,
    "attach_private_network": attachPrivateNetwork,
    "label": label,
    "sshkey_id": sshkeyId,
    "backups": backups,
    "app_id": appId,
    "user_data": userData,
    "ddos_protection": ddosProtection,
    "activation_email": activationEmail,
    "hostname": hostname,
    "tag": tag,
    "firewall_group_id": firewallGroupId,
    "reserved_ipv4": reservedIpv4,
    "enable_private_network": enablePrivateNetwork
  };
}

class UpdateInstanceModel {
  int appId;
  String backups;
  String firewallGroupId;
  bool enableIpv6;
  String osId;
  String userData;
  String tag;
  String plan;
  bool ddosProtection;
  List<String> attachPrivateNetwork;
  List<String> detachPrivateNetwork;
  bool enablePrivateNetwork;

  UpdateInstanceModel.fromJson(Map<String, dynamic> json)
    : appId = json['app_id'],
      backups = json['backups'],
      firewallGroupId = json['firewall_group_id'],
      enableIpv6 = json['enable_ipv6'],
      osId = json['os_id'],
      userData = json['user_data'],
      tag = json['tag'],
      plan = json['plan'],
      ddosProtection = json['ddos_protection'],
      attachPrivateNetwork = new List<String>.from(json['attach_private_network']),
      detachPrivateNetwork = new List<String>.from(json['detach_private_network']),
      enablePrivateNetwork = json['enable_private_network'];

  Map<String, dynamic> toJson() => {
    "app_id": appId,
    "backups": backups,
    "firewall_group_id": firewallGroupId,
    "enable_ipv6": enableIpv6,
    "os_id": osId,
    "user_data": userData,
    "tag": tag,
    "plan": plan,
    "ddos_protection": ddosProtection,
    "attach_private_network": attachPrivateNetwork,
    "detach_private_network": detachPrivateNetwork,
    "enable_private_network": enablePrivateNetwork
  };
}

class PrivateNetworksInstanceModel {
  List<PrivateNetworkInstanceModel> privateNetworks;
  MetaModel meta;

  PrivateNetworksInstanceModel.fromJson(Map<String, dynamic> json)
    : privateNetworks = (json['private_networks'] as List).map((e) => PrivateNetworkInstanceModel.fromJson(e)).toList(),
      meta = MetaModel.fromJson(json['meta']);

  Map<String, dynamic> toJson() => {
    "private_networks": privateNetworks,
    "meta": meta
  };
}

class PrivateNetworkInstanceModel {
  String networkId;
  String macAddress;
  String ipAddress;

  PrivateNetworkInstanceModel.fromJson(Map<String, dynamic> json)
    : networkId = json['network_id'],
      macAddress = json['mac_address'],
      ipAddress = json['ip_address'];

  Map<String, dynamic> toJson() => {
    "network_id": networkId,
    "mac_address": macAddress,
    "ip_address": ipAddress
  };
}

class ISOStatusInstanceModel {
  String status;
  String isoId;

  ISOStatusInstanceModel.fromJson(Map<String, dynamic> json)
    : status = json['status'],
      isoId = json['iso_id'];

  Map<String, dynamic> toJson() => {
    "status": status,
    "iso_id": isoId
  };
}

class SetBackupScheduleInstanceModel {
  String type;
  int hour;
  int dow;
  int dom;

  SetBackupScheduleInstanceModel.fromJson(Map<String, dynamic> json)
    : type = json['type'],
      hour = json['hour'],
      dow = json['dow'],
      dom = json['dom'];

  Map<String, dynamic> toJson() => {
    "type": type,
    "hour": hour,
    "dow": dow,
    "dom": dom
  };
}

class BackupScheduleInstanceModel {
  bool enabled;
  String type;
  String nextScheduledTimeUtc;
  int hour;
  int dow;
  int dom;

  BackupScheduleInstanceModel.fromJson(Map<String, dynamic> json)
    : enabled = json['enabled'],
      type = json['type'],
      nextScheduledTimeUtc = json['next_scheduled_time_utc'],
      hour = json['hour'],
      dow = json['dow'],
      dom = json['dom'];

  Map<String, dynamic> toJson() => {
    "enabled": enabled,
    "type": type,
    "next_scheduled_time_utc": nextScheduledTimeUtc,
    "hour": hour,
    "dow": dow,
    "dom": dom
  };
}

class RestoreInstanceStatusModel {
  String restoreType;
  String restoreId;
  String status;

  RestoreInstanceStatusModel.fromJson(Map<String, dynamic> json)
    : restoreType = json['restore_type'],
      restoreId = json['restore_id'],
      status = json['status'];

  Map<String, dynamic> toJson() => {
    "restore_type": restoreType,
    "restore_id": restoreId,
    "status": status
  };
}

class IPv4sInstanceModel {
  List<IPv4InstanceModel> ipv4s;
  MetaModel meta;

  IPv4sInstanceModel.fromJson(Map<String, dynamic> json)
    : ipv4s = (json['ipv4s'] as List).map((e) => IPv4InstanceModel.fromJson(e)).toList(),
      meta = MetaModel.fromJson(json['meta']);

  Map<String, dynamic> toJson() => {
    "ipv4s": ipv4s,
    "meta": meta
  };
}

class IPv6sInstanceModel {
  List<IPv6InstanceModel> ipv46;
  MetaModel meta;

  IPv6sInstanceModel.fromJson(Map<String, dynamic> json)
    : ipv46 = (json['ipv46'] as List).map((e) => IPv6InstanceModel.fromJson(e)).toList(),
      meta = MetaModel.fromJson(json['meta']);

  Map<String, dynamic> toJson() => {
    "ipv46": ipv46,
    "meta": meta
  };
}

class IPv4InstanceModel {
  String ip;
  String netmask;
  String gateway;
  String type;
  String reverse;

  IPv4InstanceModel.fromJson(Map<String, dynamic> json)
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

class IPv6InstanceModel {
  String ip;
  String netmask;
  int networkSize;
  String type;

  IPv6InstanceModel.fromJson(Map<String, dynamic> json)
    : ip = json['ip'],
      netmask = json['netmask'],
      networkSize = json['network_size'],
      type = json['type'];

  Map<String, dynamic> toJson() => {
    "ip": ip,
    "netmask": netmask,
    "network_size": networkSize,
    "type": type
  };
}

class ReverseIPModel {
  String ip;
  String reverse;

  ReverseIPModel.fromJson(Map<String, dynamic> json)
    : ip = json['ip'],
      reverse = json['reverse'];

  Map<String, dynamic> toJson() => {
    "ip": ip,
    "reverse": reverse
  };
}

