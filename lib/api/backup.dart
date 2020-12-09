import 'package:VultrDash/api/api.dart';
import 'package:VultrDash/api/model/backup.dart';

class Backup extends API {
  Future<BackupsModel> getInfo({String instanceId = ""}) {
    return this.Get("/backups", {"instance_id": instanceId}).then(
        (value) => BackupsModel.fromJson(value));
  }

  Future<BackupModel> getBackup(String backupId) {
    return this
        .Get("/backup/$backupId", null)
        .then((value) => BackupModel.fromJson(value));
  }
}
