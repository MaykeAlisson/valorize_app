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
  final _id_contaController = TextEditingController();
  final _id_categoriaController = TextEditingController();

  bool _lanvamentoEdit = false;

  Lancamento _editaLancamento;


  @override
  void initState() {
    super.initState();

    if(widget.lancamento == null){
      _editaLancamento = Lancamento();
    }else{
      _editaLancamento = Lancamento.fromMap((widget.lancamento));

      _idController.text = _editaLancamento.id;
      _valorController.text = _editaLancamento.valor;
      _diaController.text = _editaLancamento.dia;
      _descricaoController.text = _editaLancamento.descricao;
      _
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
