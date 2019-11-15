import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class LancamentoHelper {
  static final LancamentoHelper _instance = LancamentoHelper.internal();
  String url = "http://192.168.1.86:3000";

  factory LancamentoHelper() => _instance;

  LancamentoHelper.internal();

  Future<List<dynamic>> getAllLancamento() async {
    http.Response response;

    response = await http.get(url + "/api/v1/lancamento", headers: {
    'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c3VhcmlvIjp7ImlkIjoxLCJub21lIjoiTWF5a2UgQWxpc3NvbiJ9LCJpYXQiOjE1NzM4MDY0MzUsImV4cCI6MTU3Mzg0OTYzNX0.kr9CmiS-LL0V_8stsKB51OAJY_GnLqCjYnMdVOrOI2I'
    });

    if(response.statusCode == 200){
      return json.decode(response.body);
    }

    return null;
  }
}
