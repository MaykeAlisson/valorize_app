import 'dart:convert';

import 'package:http/http.dart' as http;

class CategoriaHelper {
  static final CategoriaHelper _instance = CategoriaHelper.internal();
  String url = "http://192.168.1.86:3000/api";
  final String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c3VhcmlvIjp7ImlkIjoyLCJub21lIjoiTWF5a2UgRnVydGFkbyJ9LCJpYXQiOjE1NzQxNDg2NjIsImV4cCI6MTU3NDE5MTg2Mn0.1HompHH-qIz2GxxTPPLXb5CQPkBEuHFAXulnQSNvxKQ";

  factory CategoriaHelper() => _instance;

  CategoriaHelper.internal();

  Future<List<dynamic>> getAllCategoria() async {
    http.Response response;

    response = await http.get(url + "/v1/categoria",
        headers: {'Authorization': 'Bearer $token'});

    if (response.statusCode == 200) {
      return json.decode(response.body);
    }

    return null;
  }

  Future<bool> save(dados) async {
    http.Response response;

    response = await http.post(url + "/v1/categoria/cadastro",
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer $token'
        },
        body: dados);

    if (response.statusCode == 201) return true;

    return false;
  }

  Future<bool> update(dados) async {
    http.Response response;

    response = await http.post(url + "/v1/categoria/atualiza",
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer $token'
        },
        body: dados);

    if(response.statusCode == 200) return true;

    return false;
  }

  Future<bool> delete(dados) async {
    http.Response response;

    response = await http.post(url + "/v1/categoria/delete",
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer $token'
        },
        body: dados);

    if(response.statusCode == 200) return true;

    return false;
  }
}
