import 'package:VultrDash/api/api.dart';
import 'package:VultrDash/api/model/sshkey.dart';

class SSHKey extends API {
  Future<SSHKeysModel> getInfo() {
    return this
        .Get("/ssh-keys", null)
        .then((value) => SSHKeysModel.fromJson(value));
  }

  Future<SSHKeyModel> getSSHKey(String sshkeyId) {
    return this
        .Get("/ssh-keys/$sshkeyId", null)
        .then((value) => SSHKeyModel.fromJson(value["ssh_key"]));
  }

  Future updateSSHKey(String sshkeyId, String name, String sshkey) {
    return this
        .Patch("/ssh-keys/$sshkeyId", null, {"name": name, "ssh_key": sshkey});
  }

  Future deleteSSHKey(String sshkeyId) {
    return this.Delete("/ssh-keys/$sshkeyId", null, null);
  }

  Future<SSHKeyModel> createSSHKey(String name, String sshkey) {
    return this.Post("/ssh-keys", null, {"name": name, "ssh_key": sshkey}).then(
        (value) => SSHKeyModel.fromJson(value["ssh_key"]));
  }
}
