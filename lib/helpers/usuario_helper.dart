import 'dart:convert';

import 'package:http/http.dart' as http;

class UsuarioHelper {
  static final UsuarioHelper _instance = UsuarioHelper.internal();
  String url = "http://localhost:3000/api";

  factory UsuarioHelper() => _instance;

  UsuarioHelper.internal();

  Future<bool> save(dados) async {
    http.Response response;

    response = await http.post(url + "/v1/usuario/cadastro",
        headers: {"Content-Type": "application/json"}, body: dados);

    if (response.statusCode == 201) return true;

    return false;
  }

  Future<Map> login(dados) async {
    http.Response response;

    response = await http.post(url + "/v1/usuario/login",
        headers: {"Content-Type": "application/json"}, body: dados);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    }

    return null;
  }
}

class Usuario {
  String nome;
  String sexo;
  String nascimento;
  String email;
  String senha;

  Usuario();
}
