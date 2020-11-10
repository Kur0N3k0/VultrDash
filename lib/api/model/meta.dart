class MetaModel {
  int total;
  Map<String, String> links;

  MetaModel.fromJson(Map<String, dynamic> json)
      : total = json["total"],
        links = json["links"] as Map<String, String>;

  Map<String, dynamic> toJson() => {"total": total, "links": links};
}
