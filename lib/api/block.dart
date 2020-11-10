import 'package:VultrDash/api/api.dart';
import 'package:VultrDash/api/model/blockStorage.dart';

class Block extends API {
  Future<BlockStoragesModel> getInfo() {
    return this
        .Get("/blocks", null)
        .then((value) => BlockStoragesModel.fromJson(value));
  }

  Future<BlockStorageModel> createBlockStorage(CreateBlockStorageModel param) {
    return this
        .Post("/blocks", null, param.toJson())
        .then((value) => BlockStorageModel.fromJson(value["block"]));
  }

  Future<BlockStorageModel> getBlockStorage(String blockId) {
    return this
        .Get("/blocks/$blockId", null)
        .then((value) => BlockStorageModel.fromJson(value["block"]));
  }

  Future updateBlockStorage(String blockId, UpdateBlockStorageModel param) {
    return this.Patch("/blocks/$blockId", null, param.toJson());
  }

  Future deleteBlockStorage(String blockId) {
    return this.Delete("/blocks/$blockId", null, null);
  }

  Future attachBlockStorage(String blockId, String instanceId, bool live) {
    return this.Post("/blocks/$blockId/attach", null,
        {"instance_id": instanceId, "live": live});
  }

  Future detachBlockStorage(String blockId, bool live) {
    return this.Post("/blocks/$blockId/detach", null, {"live": live});
  }
}
