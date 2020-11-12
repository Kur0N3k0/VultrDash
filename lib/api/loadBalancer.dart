import 'package:VultrDash/api/api.dart';
import 'package:VultrDash/api/model/loadbalancer.dart';

class LoadBalancer extends API {
  Future<LoadBalancersModel> getInfo() {
    return this
        .Get("/load-balancers", null)
        .then((value) => LoadBalancersModel.fromJson(value));
  }

  Future<LoadBalancerModel> createLoadBalancer(CreateLoadBalancerModel param) {
    return this
        .Post("/load-balancers", null, param.toJson())
        .then((value) => LoadBalancerModel.fromJson(value["load_balancer"]));
  }

  Future<LoadBalancerModel> getLoadBalancer(String loadbalancerId) {
    return this
        .Get("/load-balancers/$loadbalancerId", null)
        .then((value) => LoadBalancerModel.fromJson(value["load_balancer"]));
  }

  Future updateLoadBalancer(
      String loadbalancerId, UpdateLoadBalancerModel param) {
    return this.Patch("/load-balancers/$loadbalancerId", null, param.toJson());
  }

  Future deleteLoadBalancer(String loadbalancerId) {
    return this.Delete("/load-balancers/$loadbalancerId", null, null);
  }

  Future<LoadBalancerForwardingRulesModel> getForwardingRules(
      String loadbalancerId) {
    return this
        .Get("/load-balancers/$loadbalancerId/forwarding-rules", null)
        .then((value) => LoadBalancerForwardingRulesModel.fromJson(value));
  }

  Future<LoadBalancerForwardingRuleModel> createForwardingRule(
      String loadbalancerId, CreateLoadBalancerForwardingRuleModel param) {
    return this
        .Post("/load-balancers/$loadbalancerId/forwarding-rules", null,
            param.toJson())
        .then((value) => LoadBalancerForwardingRuleModel.fromJson(value));
  }

  Future<LoadBalancerForwardingRuleModel> getForwardingRule(
      String loadbalancerId, String forwardingruleId) {
    return this
        .Get(
            "/load-balancers/$loadbalancerId/forwarding-rules/$forwardingruleId",
            null)
        .then((value) =>
            LoadBalancerForwardingRuleModel.fromJson(value["forwarding_rule"]));
  }

  Future deleteForwardingRule(String loadbalancerId, String forwardingruleId) {
    return this.Delete(
        "/load-balancers/$loadbalancerId/forwarding-rules/$forwardingruleId",
        null,
        null);
  }
}
