import 'dart:developer';

import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class BaseRepository {
  static const _baseUrl = "http://localhost:8080";
  static final Map<String, String> _headers = {
    "Content-Type": "application/json",
  };
  static String _token = "";

  static void setToken(String token) {
    _token = token;
    _headers["Authorization"] = 'Bearer $_token';
  }

  static void removeToken() {
    _token = "";
    _headers.remove("Authorization");
  }

  static Future<Map<String, dynamic>> get(String path) async {
    try {
      final res = await http.get(Uri.parse(_baseUrl + path), headers: _headers);
      log(res.body);
      switch (res.statusCode) {
        case 200:
          return json.decode(utf8.decode(res.bodyBytes));
        default:
          throw Exception("http error (${res.statusCode})");
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> getWithParams(
      String path, Map<String, dynamic> queryParams) async {
    try {
      var uri =
          Uri.parse(_baseUrl + path).replace(queryParameters: queryParams);
      print(uri);
      const headers = {"Accept": "application/json"};
      final res = await http.get(uri, headers: headers);
      log(json.encode(json.decode(utf8.decode(res.bodyBytes))));
      if(res.bodyBytes.isEmpty) return {};
      switch (res.statusCode) {
        case 200:
          return json.decode(utf8.decode(res.bodyBytes));
        default:
          throw Exception("http error (${res.statusCode}) : ${res.body}");
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> post(
      String path, Map<String, dynamic> body) async {
    try {
      final res = await http.post(Uri.parse(_baseUrl + path),
          headers: _headers, body: json.encode(body));
      log(res.body);
      if(res.bodyBytes.isEmpty) return {};
      switch (res.statusCode) {
        case 200:
          return json.decode(utf8.decode(res.bodyBytes));
        default:
          throw Exception("http error (${res.statusCode}) : ${res.body}");
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> put(
      String path, Map<String, dynamic> body) async {
    try {
      final res = await http.put(Uri.parse(_baseUrl + path),
          headers: _headers, body: jsonEncode(body));
      log(res.body);
      if(res.bodyBytes.isEmpty) return {};
      switch (res.statusCode) {
        case 200:
          return json.decode(utf8.decode(res.bodyBytes));
        default:
          throw Exception("http error (${res.statusCode}) : ${res.body}");
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> delete(String path) async {
    try {
      final res =
          await http.delete(Uri.parse(_baseUrl + path), headers: _headers);
      if(res.bodyBytes.isEmpty) return {};
      switch (res.statusCode) {
        case 200:
          return json.decode(utf8.decode(res.bodyBytes));
        default:
          throw Exception("http error (${res.statusCode}) : ${res.body}");
      }
    } catch (e) {
      rethrow;
    }
  }

  String path = "";
}
