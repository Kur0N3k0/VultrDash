import 'common.dart';
import 'dart:ffi';

class MetaModel {
  int total;
  Map<String, String> links;

  MetaModel.fromJson(Map<String, dynamic> json)
      : total = json['total'],
        links = json['links'];

  Map<String, dynamic> toJson() => {"total": total, "links": links};
}

class BandwidthModel {
  int incomingBytes;
  int outgoingBytes;

  BandwidthModel.fromJson(Map<String, dynamic> json)
      : incomingBytes = json['incoming_bytes'],
        outgoingBytes = json['outgoing_bytes'];

  Map<String, dynamic> toJson() =>
      {"incoming_bytes": incomingBytes, "outgoing_bytes": outgoingBytes};
}
