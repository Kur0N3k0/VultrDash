import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class API {
  final String baseUrl = "https://api.vultr.com/v2";
  static String credential = "";

  String parameterize(Map<String, dynamic> data) {
    var param = [];
    data.forEach((key, value) {
      param += ["$key=$value"];
    });
    return "?${param.join('&')}";
  }

  Future<Map<String, dynamic>> Get(
      String url, Map<String, dynamic> param) async {
    var pstr = "";
    if (param != null) {
      pstr = parameterize(param);
    }
    var resp = await http.get("$baseUrl$url$pstr",
        headers: {"Authorization": "Bearer $credential"});

    if (resp.statusCode >= 400) {
      return Future.error(resp.statusCode);
    }
    if (resp.body.length != 0) return convert.json.decode(resp.body);
    return {};
  }

  Future<Map<String, dynamic>> Post(
      String url, Map<String, dynamic> param, Map<String, dynamic> body) async {
    var pstr = "";
    if (param != null) {
      pstr = parameterize(param);
    }

    var resp = await http.post("$baseUrl$url$pstr",
        headers: {
          "Authorization": "Bearer $credential",
          "Content-Type": "application/json"
        },
        body: convert.jsonEncode(body));

    if (resp.statusCode >= 400) {
      return Future.error(resp.statusCode);
    }
    if (resp.body.length != 0) return convert.json.decode(resp.body);
    return {};
  }

  Future<Map<String, dynamic>> Put(
      String url, Map<String, dynamic> param, Map<String, dynamic> body) async {
    var pstr = "";
    if (param != null) {
      pstr = parameterize(param);
    }

    var resp = await http.put("$baseUrl$url$pstr",
        headers: {
          "Authorization": "Bearer $credential",
          "Content-Type": "application/json"
        },
        body: convert.jsonEncode(body));
    if (resp.statusCode >= 400) {
      return Future.error(resp.statusCode);
    }
    if (resp.body.length != 0) return convert.json.decode(resp.body);
    return {};
  }

  Future<Map<String, dynamic>> Patch(
      String url, Map<String, dynamic> param, Map<String, dynamic> body) async {
    var pstr = "";
    if (param != null) {
      pstr = parameterize(param);
    }

    var resp = await http.patch("$baseUrl$url$pstr",
        headers: {
          "Authorization": "Bearer $credential",
          "Content-Type": "application/json"
        },
        body: convert.jsonEncode(body));
    if (resp.statusCode >= 400) {
      return Future.error(resp.statusCode);
    }
    if (resp.body.length != 0) return convert.json.decode(resp.body);
    return {};
  }

  Future<Map<String, dynamic>> Delete(
      String url, Map<String, dynamic> param, Map<String, dynamic> body) async {
    var pstr = "";
    if (param != null) {
      pstr = parameterize(param);
    }

    var resp = await http.delete(
      "$baseUrl$url$pstr",
      headers: {
        "Authorization": "Bearer $credential",
        "Content-Type": "application/json"
      },
    );
    if (resp.statusCode >= 400) {
      return Future.error(resp.statusCode);
    }
    if (resp.body.length != 0) return convert.json.decode(resp.body);
    return {};
  }
}
