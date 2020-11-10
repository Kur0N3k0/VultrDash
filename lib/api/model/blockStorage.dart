import 'common.dart';
import 'dart:ffi';

class BlockStoragesModel {
  List<BlockStorageModel> blocks;
  MetaModel meta;

  BlockStoragesModel.fromJson(Map<String, dynamic> json)
      : blocks =
            (json['blocks'] as List).map((e) => BlockStorageModel.fromJson(e)),
        meta = MetaModel.fromJson(json['blocks']);

  Map<String, dynamic> toJson() => {"blocks": blocks, "meta": meta};
}

class BlockStorageModel {
  String id;
  String dateCreated;
  int cost;
  String status;
  int sizeGb;
  String region;
  int attachedToInstance;
  String label;

  BlockStorageModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        dateCreated = json['date_created'],
        cost = json['cost'],
        status = json['status'],
        sizeGb = json['size_gb'],
        region = json['region'],
        attachedToInstance = json['attached_to_instance'],
        label = json['label'];

  Map<String, dynamic> toJson() => {
        "id": id,
        "date_created": dateCreated,
        "cost": cost,
        "status": status,
        "size_gb": sizeGb,
        "region": region,
        "attached_to_instance": attachedToInstance,
        "label": label
      };
}

class CreateBlockStorageModel {
  String region;
  int sizeGb;
  String label;

  CreateBlockStorageModel.fromJson(Map<String, dynamic> json)
      : region = json['region'],
        sizeGb = json['size_gb'],
        label = json['label'];

  Map<String, dynamic> toJson() =>
      {"region": region, "size_gb": sizeGb, "label": label};
}

class UpdateBlockStorageModel {
  String label;
  int sizeGb;

  UpdateBlockStorageModel.fromJson(Map<String, dynamic> json)
      : label = json['label'],
        sizeGb = json['size_gb'];

  Map<String, dynamic> toJson() => {"label": label, "size_gb": sizeGb};
}
