import 'package:VultrDash/api/api.dart';
import 'package:VultrDash/api/model/sshkey.dart';
import 'package:VultrDash/api/model/startupScript.dart';

class StartupScript extends API {
  Future<StartupScriptsModel> getInfo() {
    return this
        .Get("/startup-scripts", null)
        .then((value) => StartupScriptsModel.fromJson(value));
  }

  Future<StartupScriptModel> getStartupScript(String startupId) {
    return this
        .Get("/startup-scripts/$startupId", null)
        .then((value) => StartupScriptModel.fromJson(value["startup_script"]));
  }

  Future updateStartupScript(
      String startupId, String name, String script, String type) {
    return this.Patch("/startup-scripts/$startupId", null,
        {"name": name, "script": script, "type": type});
  }

  Future deleteStartupScript(String startupId) {
    return this.Delete("/startup-scripts/$startupId", null, null);
  }

  Future<StartupScriptModel> createStartupScript(
      String name, String script, String type) {
    return this.Post("/startup-scripts", null, {
      "name": name,
      "script": script,
      "type": type
    }).then((value) => StartupScriptModel.fromJson(value["startup_script"]));
  }
}
