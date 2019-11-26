import 'package:flutter/material.dart';
import 'package:valoriza_app/helpers/lancamento_helper.dart';

class LancamentoPage extends StatefulWidget {
  final Lancamento lancamento;

  LancamentoPage({this.lancamento});

  @override
  _LancamentoPageState createState() => _LancamentoPageState();
}

class _LancamentoPageState extends State<LancamentoPage> {
  final _idController = TextEditingController();
  final _valorController = TextEditingController();
  final _diaController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _tagsController = TextEditingController();
  final _noteController = TextEditingController();
  final _idContaController = TextEditingController();
  final _idCategoriaController = TextEditingController();

  bool _lancamentoEdit = false;

  Lancamento _editaLancamento;

  @override
  void initState() {
    super.initState();

    if (widget.lancamento == null) {
      _editaLancamento = Lancamento();
    } else {
      _editaLancamento = Lancamento.fromMap((widget.lancamento));

      _idController.text = _editaLancamento.id;
      _valorController.text = _editaLancamento.valor;
      _diaController.text = _editaLancamento.dia;
      _descricaoController.text = _editaLancamento.descricao;
      _tagsController.text = _editaLancamento.tags;
      _noteController.text = _editaLancamento.note;
      _idContaController.text = _editaLancamento.idConta;
      _idCategoriaController.text = _editaLancamento.idCategoria;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _requestPop,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: Text(_editaLancamento.descricao ?? "Novo Lançamento"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_editaLancamento.descricao != null &&
                _editaLancamento.descricao.isNotEmpty) {
              Navigator.pop(context, _editaLancamento);
            }
            // TODO VALIDAR FORMULARIO
          },
          child: Icon(Icons.save),
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: "Descrição"),
                controller: _descricaoController,
                onChanged: (text) {
                  _lancamentoEdit = true;
                  setState(() {
                    _editaLancamento.descricao = text;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: "Valor"),
                controller: _valorController,
                onChanged: (text) {
                  _lancamentoEdit = true;
                  _editaLancamento.valor = text;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _requestPop() {
    if (_lancamentoEdit) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Descartar Alterações?"),
            content: Text("Se sair as alterações serão perdidas."),
            actions: <Widget>[
              FlatButton(
                child: Text("Cancelar"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text("Sim"),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}
