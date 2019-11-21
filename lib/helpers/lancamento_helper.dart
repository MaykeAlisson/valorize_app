import 'dart:convert';

import 'package:http/http.dart' as http;

class LancamentoHelper {
  static final LancamentoHelper _instance = LancamentoHelper.internal();
  String url = "http://192.168.100.40:3000/api";
  final String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c3VhcmlvIjp7ImlkIjoxLCJub21lIjoiTWF5a2UgQWxpc3NvbiJ9LCJpYXQiOjE1NzQzNDkwMDUsImV4cCI6MTU3NDM5MjIwNX0.NCaqbXlrmGdP-C-HpvR3nlm8JS_Efyq2m_EJQLdsDRM";
  factory LancamentoHelper() => _instance;

  LancamentoHelper.internal();

  Future<List<dynamic>> getAllLancamento() async {
    http.Response response;

    response = await http.get(url + "/v1/lancamento",
        headers: {'Authorization': 'Bearer $token'});

    if (response.statusCode == 200) {
      return json.decode(response.body);
    }

    return null;
  }

  Future<bool> save(dados) async {
    http.Response response;

    response = await http.post(url + "/v1/lancamento/cadastro",
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer $token'
        },
        body: dados);

    print(response.body);
    print(response.request);
    print(response.request.headers);
    if (response.statusCode == 201) return true;

    return false;
  }

  Future<bool> deletaPorId(dados) async {
    http.Response response;

    print(dados);

    response = await http.post(url + "/v1/lancamento/deleta",
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

    response = await http.post(url + "/v1/lancamento/update",
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer $token'
        },
        body: dados);

    if (response.statusCode == 200) return true;

    return false;
  }
}
