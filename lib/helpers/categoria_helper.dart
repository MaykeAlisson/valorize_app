import 'dart:convert';

import 'package:http/http.dart' as http;

class CategoriaHelper {
  static final CategoriaHelper _instance = CategoriaHelper.internal();
  String url = "http://192.168.1.86:3000/api";
  final String token = "tokenValido1234560";

  factory CategoriaHelper() => _instance;

  CategoriaHelper.internal();

  Future<List<dynamic>> getAllCategoria() async {
    http.Response response;

    response = await http.get(url + "/v1/categoria",
        headers: {'Authorization': 'Bearer $token'});

    if(response.statusCode == 200){
      return json.decode(response.body);
    }

    return null;
  }
}
