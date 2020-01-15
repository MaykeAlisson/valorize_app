import 'dart:convert';

import 'package:http/http.dart' as http;

final String idColunm = "idColunm";
final String valorColunm = "valorColunm";
final String diaColunm = "diaColunm";
final String descricaoColunm = "descricaoColunm";
final String tagsColunm = "tagsColunm";
final String noteColunm = "noteColunm";
final String idContaColunm = "idContaColunm";
final String idCategoriaColunm = "idCategoriaColunm";

class LancamentoHelper {
  static final LancamentoHelper _instance = LancamentoHelper.internal();
  String url = "http://192.168.100.40:3000/api";
  final String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c3VhcmlvIjp7ImlkIjoxLCJub21lIjoiTWF5a2UgQWxpc3NvbiJ9LCJpYXQiOjE1NzQ4NDA4NjEsImV4cCI6MTU3NDg4NDA2MX0.jPPwvhwc45O94FV_ACZWBGorYLMN2njWzn9oFYGEvlA";

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

    if (response.statusCode == 201) return true;

    return false;
  }

  Future<bool> deletaPorId(dados) async {
    http.Response response;

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

class Lancamento {
  String id;
  String valor;
  String dia;
  String descricao;
  String tags;
  String note;
  String idConta;
  String idCategoria;

  Lancamento();

  Lancamento.fromMap(lancamento) {
    id = lancamento[id];
    valor = lancamento[valor];
    dia = lancamento[dia];
    descricao = lancamento[descricao];
    tags = lancamento[tags];
    note = lancamento[note];
    idConta = lancamento[idConta];
    idCategoria = lancamento[idCategoria];
  }

//  Map toMap(){
//    Map<String, dynamic> map = {
//      valorColunm = valor,
//      diaColunm = dia,
//      descricaoColunm = descricao,
//      tagsColunm = tags,
//      noteColunm = note,
//      idContaColunm = idConta,
//      idCategoriaColunm = idCategoria
//    };
//  if(id != null){
//    map[idColunm] = id;
//  }
//  return map;
//  }

}
