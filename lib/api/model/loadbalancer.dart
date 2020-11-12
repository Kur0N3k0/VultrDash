import 'common.dart';
import 'dart:ffi';

class LoadBalancersModel {
  List<LoadBalancerModel> loadBalancers;
  MetaModel meta;

  LoadBalancersModel.fromJson(Map<String, dynamic> json)
    : loadBalancers = (json['load_balancers'] as List).map((e) => LoadBalancerModel.fromJson(e)),
      meta = MetaModel.fromJson(json['load_balancers']);

  Map<String, dynamic> toJson() => {
    "load_balancers": loadBalancers,
    "meta": meta
  };
}

class LoadBalancerModel {
  String id;
  String dateCreated;
  String region;
  String label;
  String status;
  String ipv4;
  String ipv6;
  LoadBalancerGenericInfoModel genericInfo;
  LoadBalancerHealthCheckModel healthCheck;
  bool hasSsl;
  List<LoadBalancerForwardingRuleModel> forwardingRules;
  List<String> instances;

  LoadBalancerModel.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      dateCreated = json['date_created'],
      region = json['region'],
      label = json['label'],
      status = json['status'],
      ipv4 = json['ipv4'],
      ipv6 = json['ipv6'],
      genericInfo = LoadBalancerGenericInfoModel.fromJson(json['id']),
      healthCheck = LoadBalancerHealthCheckModel.fromJson(json['id']),
      hasSsl = json['has_ssl'],
      forwardingRules = (json['forwarding_rules'] as List).map((e) => LoadBalancerForwardingRuleModel.fromJson(e)),
      instances = json['instances'];

  Map<String, dynamic> toJson() => {
    "id": id,
    "date_created": dateCreated,
    "region": region,
    "label": label,
    "status": status,
    "ipv4": ipv4,
    "ipv6": ipv6,
    "generic_info": genericInfo,
    "health_check": healthCheck,
    "has_ssl": hasSsl,
    "forwarding_rules": forwardingRules,
    "instances": instances
  };
}

class LoadBalancerGenericInfoModel {
  String balancingAlgorithm;
  bool sslRedirect;
  Map<String, String> stickySessions;
  bool proxyProtocol;

  LoadBalancerGenericInfoModel.fromJson(Map<String, dynamic> json)
    : balancingAlgorithm = json['balancing_algorithm'],
      sslRedirect = json['ssl_redirect'],
      stickySessions = json['sticky_sessions'],
      proxyProtocol = json['proxy_protocol'];

  Map<String, dynamic> toJson() => {
    "balancing_algorithm": balancingAlgorithm,
    "ssl_redirect": sslRedirect,
    "sticky_sessions": stickySessions,
    "proxy_protocol": proxyProtocol
  };
}

class LoadBalancerHealthCheckModel {
  String protocol;
  int port;
  String path;
  int checkInterval;
  int responseTimeout;
  int unhealthyThreshold;
  int healthyThreshold;

  LoadBalancerHealthCheckModel.fromJson(Map<String, dynamic> json)
    : protocol = json['protocol'],
      port = json['port'],
      path = json['path'],
      checkInterval = json['check_interval'],
      responseTimeout = json['response_timeout'],
      unhealthyThreshold = json['unhealthy_threshold'],
      healthyThreshold = json['healthy_threshold'];

  Map<String, dynamic> toJson() => {
    "protocol": protocol,
    "port": port,
    "path": path,
    "check_interval": checkInterval,
    "response_timeout": responseTimeout,
    "unhealthy_threshold": unhealthyThreshold,
    "healthy_threshold": healthyThreshold
  };
}

class LoadBalancerForwardingRuleModel {
  String id;
  String frontendProtocol;
  int frontendPort;
  String backendProtocol;
  int backendPort;

  LoadBalancerForwardingRuleModel.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      frontendProtocol = json['frontend_protocol'],
      frontendPort = json['frontend_port'],
      backendProtocol = json['backend_protocol'],
      backendPort = json['backend_port'];

  Map<String, dynamic> toJson() => {
    "id": id,
    "frontend_protocol": frontendProtocol,
    "frontend_port": frontendPort,
    "backend_protocol": backendProtocol,
    "backend_port": backendPort
  };
}

class CreateLoadBalancerModel {
  String region;
  String balancingAlgorithm;
  bool sslRedirect;
  bool proxyProtocol;
  LoadBalancerHealthCheckModel healthCheck;
  List<LoadBalancerForwardingRuleModel> forwardingRules;
  Map<String, String> stickySession;
  SSLLoadBalancerModel ssl;
  String label;
  List<String> instances;

  CreateLoadBalancerModel.fromJson(Map<String, dynamic> json)
    : region = json['region'],
      balancingAlgorithm = json['balancing_algorithm'],
      sslRedirect = json['ssl_redirect'],
      proxyProtocol = json['proxy_protocol'],
      healthCheck = LoadBalancerHealthCheckModel.fromJson(json['region']),
      forwardingRules = (json['forwarding_rules'] as List).map((e) => LoadBalancerForwardingRuleModel.fromJson(e)),
      stickySession = json['sticky_session'],
      ssl = SSLLoadBalancerModel.fromJson(json['region']),
      label = json['label'],
      instances = json['instances'];

  Map<String, dynamic> toJson() => {
    "region": region,
    "balancing_algorithm": balancingAlgorithm,
    "ssl_redirect": sslRedirect,
    "proxy_protocol": proxyProtocol,
    "health_check": healthCheck,
    "forwarding_rules": forwardingRules,
    "sticky_session": stickySession,
    "ssl": ssl,
    "label": label,
    "instances": instances
  };
}

class SSLLoadBalancerModel {
  String priateKey;
  String certificate;
  String chain;

  SSLLoadBalancerModel.fromJson(Map<String, dynamic> json)
    : priateKey = json['priate_key'],
      certificate = json['certificate'],
      chain = json['chain'];

  Map<String, dynamic> toJson() => {
    "priate_key": priateKey,
    "certificate": certificate,
    "chain": chain
  };
}

class UpdateLoadBalancerModel {
  SSLLoadBalancerModel ssl;
  Map<String, String> stickySession;
  List<LoadBalancerForwardingRuleModel> forwardingRules;
  LoadBalancerHealthCheckModel healthCheck;
  bool proxyProtocol;
  bool sslRedirect;
  String balancingAlgorithm;
  List<String> instances;

  UpdateLoadBalancerModel.fromJson(Map<String, dynamic> json)
    : ssl = SSLLoadBalancerModel.fromJson(json['ssl']),
      stickySession = json['sticky_session'],
      forwardingRules = (json['forwarding_rules'] as List).map((e) => LoadBalancerForwardingRuleModel.fromJson(e)),
      healthCheck = LoadBalancerHealthCheckModel.fromJson(json['ssl']),
      proxyProtocol = json['proxy_protocol'],
      sslRedirect = json['ssl_redirect'],
      balancingAlgorithm = json['balancing_algorithm'],
      instances = json['instances'];

  Map<String, dynamic> toJson() => {
    "ssl": ssl,
    "sticky_session": stickySession,
    "forwarding_rules": forwardingRules,
    "health_check": healthCheck,
    "proxy_protocol": proxyProtocol,
    "ssl_redirect": sslRedirect,
    "balancing_algorithm": balancingAlgorithm,
    "instances": instances
  };
}

class LoadBalancerForwardingRulesModel {
  List<LoadBalancerForwardingRuleModel> forwardingRules;
  MetaModel meta;

  LoadBalancerForwardingRulesModel.fromJson(Map<String, dynamic> json)
    : forwardingRules = (json['forwarding_rules'] as List).map((e) => LoadBalancerForwardingRuleModel.fromJson(e)),
      meta = MetaModel.fromJson(json['forwarding_rules']);

  Map<String, dynamic> toJson() => {
    "forwarding_rules": forwardingRules,
    "meta": meta
  };
}

class CreateLoadBalancerForwardingRuleModel {
  String frontendProtocol;
  int frontendPort;
  String backendProtocol;
  int backendPort;

  CreateLoadBalancerForwardingRuleModel.fromJson(Map<String, dynamic> json)
    : frontendProtocol = json['frontend_protocol'],
      frontendPort = json['frontend_port'],
      backendProtocol = json['backend_protocol'],
      backendPort = json['backend_port'];

  Map<String, dynamic> toJson() => {
    "frontend_protocol": frontendProtocol,
    "frontend_port": frontendPort,
    "backend_protocol": backendProtocol,
    "backend_port": backendPort
  };
}

