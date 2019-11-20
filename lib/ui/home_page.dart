import 'dart:core';

import 'package:flutter/material.dart';
import 'package:valoriza_app/helpers/categoria_helper.dart';
import 'package:valoriza_app/helpers/conta_helper.dart';
import 'package:valoriza_app/helpers/lancamento_helper.dart';
import 'package:valoriza_app/helpers/usuario_helper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  LancamentoHelper lancamentoHelper = LancamentoHelper();
  UsuarioHelper usuarioHelper = UsuarioHelper();
  CategoriaHelper categoriaHelper = CategoriaHelper();
  ContaHelper contaHelper = ContaHelper();

  List<dynamic> lancamentos = List();

  @override
  void initState() {
    super.initState();
    _getAllLancamentos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Valorize"),
        backgroundColor: Colors.lightBlueAccent,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        child: Icon(Icons.add),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10.0),
          itemCount: lancamentos.length,
          itemBuilder: (context, index) {
          return _lancamentoCard(context, index);
          }
      ),
    );
  }

  Widget _lancamentoCard(BuildContext context, int index){
    return GestureDetector(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('R\$ ${lancamentos[index]['valor']} - ${lancamentos[index]['descricao']}',
                    style: TextStyle(fontSize: 20.0,
                    fontWeight: FontWeight.bold
                    ),
                  ),
                  Text('${lancamentos[index]['categoria']}  - ${lancamentos[index]['conta']}',
                    style: TextStyle(fontSize: 18.0
                    ),
                  ),
                  Text('${lancamentos[index]['operacao']}',
                    style: TextStyle(fontSize: 18.0,
                      color: lancamentos[index]['operacao'] == 'DEBIT' ? Colors.redAccent : Colors.green
                    ),
                  ),
                  Text('${lancamentos[index]['dia']} ',
                    style: TextStyle(fontSize: 18.0
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  void _getAllLancamentos(){
    lancamentoHelper.getAllLancamento()
        .then((list){
          setState(() {
            lancamentos = list;
          });
    });
  }

}
