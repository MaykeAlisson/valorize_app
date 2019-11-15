import 'package:flutter/material.dart';
import 'package:valoriza_app/helpers/lancamento_helper.dart';
import 'package:valoriza_app/helpers/usuario_helper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  LancamentoHelper lancamentoHelper = LancamentoHelper();
  UsuarioHelper usuarioHelper = UsuarioHelper();


  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void initState() {
    super.initState();
    var dados = {
      "email": "maykealison@gmail.com",
      "senha": "123456"
    };

    usuarioHelper.login(dados).then((res){
      print(res);
    });
//    lancamentoHelper.getAllLancamento().then((map){
//      print(map);
//    });
  }
}
