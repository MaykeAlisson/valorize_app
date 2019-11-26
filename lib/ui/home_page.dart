import 'dart:core';

import 'package:flutter/material.dart';
import 'package:valoriza_app/helpers/categoria_helper.dart';
import 'package:valoriza_app/helpers/conta_helper.dart';
import 'package:valoriza_app/helpers/lancamento_helper.dart';
import 'package:valoriza_app/helpers/usuario_helper.dart';

import 'lancamento_page.dart';

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
      backgroundColor: Colors.amber[50],
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        child: Icon(Icons.add),
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder(
          future: lancamentoHelper.getAllLancamento(),
          builder: (context, snapshot){
            switch(snapshot.connectionState){
              case ConnectionState.waiting:
              case ConnectionState.none:
                return Container(
                  width: 500.0,
                  height: 500.0,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    strokeWidth: 8.0,
                  ),
                );
              default:
                if(snapshot.hasError) {
                  return Container();
                }else {
                  if(lancamentos == null){
                    return Container();
                  }
                  return ListView.builder(
                      padding: EdgeInsets.all(10.0),
                      itemCount: lancamentos.length,
                      itemBuilder: (context, index) {
                        return _lancamentoCard(context, index);
                      }
                  );
                }
            }
          },
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
      onTap: () {
        _showOptions(context, index);
      },
    );
  }

  void _showOptions(BuildContext context, int index){
    showModalBottomSheet(
        context: context,
        builder: (context){
          return BottomSheet(
            onClosing: (){},
            builder: (context){
              return Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FlatButton(
                        child: Text('Editar',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                        ),
                        onPressed: (){
                          Navigator.pop(context);
                          _showLancamentoPage(lancamento: lancamentos[index]);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FlatButton(
                        child: Text('Excluir',
                          style: TextStyle(color: Colors.black, fontSize: 15.0),
                        ),
                        onPressed: (){
                         Map<String, String> jsonForm = {
                           "id": lancamentos[index]['id'].toString()
                         };
                          lancamentoHelper.deletaPorId(jsonForm);
                          setState(() {
                            lancamentos.removeAt(index);
                            Navigator.pop(context);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
    );
  }

  void _showLancamentoPage({Lancamento lancamento}) async{
    final recLancamento = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => LancamentoPage(lancamento: lancamento)));
    if(recLancamento != null){
      await lancamentoHelper.update(recLancamento);
    }else{
      await lancamentoHelper.save(recLancamento);
    }
    _getAllLancamentos();
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
