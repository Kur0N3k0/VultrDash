import 'package:VultrDash/api/api.dart';
import 'package:VultrDash/api/model/firewall.dart';

class Firewall extends API {
  Future<FirewallGroupsModel> getGroups() {
    return this
        .Get("/firewalls", null)
        .then((value) => FirewallGroupsModel.fromJson(value));
  }

  Future<FirewallGroupModel> createGroup(CreateFirewallGroupModel param) {
    return this
        .Post("/firewalls", null, param.toJson())
        .then((value) => FirewallGroupModel.fromJson(value["firewall_group"]));
  }

  Future<FirewallGroupModel> getGroup(String firewallGroupId) {
    return this
        .Get("/firewalls/$firewallGroupId", null)
        .then((value) => FirewallGroupModel.fromJson(value["firewall_group"]));
  }

  Future updateBareMetal(String firewallGroupId, String description) {
    return this
        .Put("/firewalls/$firewallGroupId", null, {"description": description});
  }

  Future deleteBareMetal(String firewallGroupId) {
    return this.Delete("/firewalls/$firewallGroupId", null, null);
  }

  Future<FirewallRulesModel> getRules(String firewallGroupId) {
    return this
        .Get("/firewalls/$firewallGroupId/rules", null)
        .then((value) => FirewallRulesModel.fromJson(value));
  }

  Future<FirewallGroupModel> createRule(
      String firewallGroupId, CreateFirewallRuleModel param) {
    return this
        .Post("/firewalls/$firewallGroupId/rules", null, param.toJson())
        .then((value) => FirewallGroupModel.fromJson(value["firewall_rule"]));
  }

  Future deleteRule(String firewallGroupId, String firewallRuleId) {
    return this.Delete(
        "/firewalls/$firewallGroupId/rules/$firewallRuleId", null, null);
  }

  Future<FirewallRuleModel> getRule(
      String firewallGroupId, String firewallRuleId) {
    return this
        .Get("/firewalls/$firewallGroupId/rules/$firewallRuleId", null)
        .then((value) => FirewallRuleModel.fromJson(value));
  }
}
