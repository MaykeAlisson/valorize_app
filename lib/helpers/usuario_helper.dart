import 'package:http/http.dart' as http;

class UsuarioHelper {
  static final UsuarioHelper _instance = UsuarioHelper.internal();
  String url = "http://localhost:3000/api";

  factory UsuarioHelper() => _instance;

  UsuarioHelper.internal();

  Future<bool>saveUsuario(Usuario usuario) async {
    http.Response response;
    
    response = await http.post(url+"/v1/usuario/cadastro", body: usuario);

    if(response.statusCode == 200) return true;

    return false;
  }


}

class Usuario{
  String nome;
  String sexo;
  String nascimento;
  String email;
  String senha;
  
  Usuario();
}