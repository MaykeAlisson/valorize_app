import 'dart:convert';

import 'package:http/http.dart' as http;

class ContaHelper {
  static final ContaHelper _instance = ContaHelper.internal();
  String url = "http://192.168.1.86:3000/api";

  final String token = "tokenValido123";

  factory ContaHelper() => _instance;

  ContaHelper.internal();

  Future<bool> save(dados) async {
    http.Response response;

    response = await http.post(url + "/v1/conta/cadastro",
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer $token'
        },
        body: dados);

    if (response.statusCode == 201) return true;

    return false;
  }

  Future<List<dynamic>> getAllConta (dados) async {
    http.Response response;

    response = await http.post(url + "/v1/conta",
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer $token'
        },
        body: dados);

    if (response.statusCode == 200) return json.decode(response.body);

    return null;
  }

  Future<bool> update(dados) async {
    http.Response response;

    response = await http.post(url + "/v1/conta/atualiza",
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer $token'
        },
        body: dados);

    if (response.statusCode == 200) return true;

    return false;
  }

  Future<bool> delete(dados) async {
    http.Response response;

    response = await http.post(url + "/v1/conta/deleta",
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer $token'
        },
        body: dados);

    if(response.statusCode == 200) return true;

    return false;
  }
}
