import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HttpBase{

  static String token = "";

  Future<Response> deleteRequest(String endpoint) async {
    print(endpoint+" ---- "+DateTime.now().toString());
    final response = await http.delete(
      Uri.parse(endpoint),
    );
    print(DateTime.now().toString()+" ---- "+response.body);
    return response;
  }

  Future<Response> getRequest(String endpoint) async {
    print("w.1");
    print(endpoint+" ---- "+DateTime.now().toString());
    final response = await http
        .get(Uri.parse(endpoint), headers: {
          "Accept": "application/json",
          'Authorization': token,
        });
    print(DateTime.now().toString()+" ---- "+response.body);
    print("w.2");
    print(response.body);
    return response;
  }

  Future<Response> postRequest(obj, String endpoint) async {
    print(token);
    print(endpoint+" ---- "+DateTime.now().toString());
    print(jsonEncode(obj));
    final response = await http.post(
      Uri.parse(endpoint),
      body: obj,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        'Authorization': token,
      },
    );
    print(response.statusCode);
    print(DateTime.now().toString()+" ---- "+response.body);
    return response;
  }

  Future<Response> putRequest(obj, String endpoint) async {
    print(endpoint+" ---- "+DateTime.now().toString());
    final response =
    await http.put(
        Uri.parse(endpoint),
        body: obj,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          'Authorization': token,
        });
    print(DateTime.now().toString()+" ---- "+response.body);
    return response;
  }

}