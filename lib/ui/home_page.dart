import 'package:flutter/material.dart';
import 'package:valoriza_app/helpers/lancamento_helper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  LancamentoHelper lancamentoHelper = LancamentoHelper();


  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void initState() {
    super.initState();

    lancamentoHelper.getAllLancamento().then((map){
      print(map);
    });
  }
}
