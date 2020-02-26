import 'package:campo_minado/components/tabuleiro_widget.dart';
import 'package:campo_minado/models/explosao_exception.dart';
import 'package:campo_minado/models/tabuleiro.dart';
import 'package:flutter/material.dart';
import '../components/resultado_widget.dart';
import '../models/campo.dart';

class CampoMinadoApp extends StatefulWidget {
  @override
  _CampoMinadoAppState createState() => _CampoMinadoAppState();
}

class _CampoMinadoAppState extends State<CampoMinadoApp> {
  bool _venceu;
  Tabuleiro _tabuleiro = Tabuleiro(
    linhas: 10,
    colunas: 10,
    qtdeBombas: 3,
  );

  void _reiniciar() {
    setState(() {
      _venceu = null;
      _tabuleiro.reiniciar();
    });
  }

  void _abrir(Campo campo) {
    setState(() {
      try {
        campo.abrir();

        if(_tabuleiro.resolvido) _venceu = true;

      } on ExplosaoException {
        _tabuleiro.revelarBombas();
        _venceu = false;
      }
    });
  }

  void _alternarMarcacao(Campo campo) {
    setState(() {
      campo.altenarMarcacao();
      if(_tabuleiro.resolvido) _venceu = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: ResultadoWidget(
          venceu: _venceu,
          onReiniciar: _reiniciar,
        ),
        body: Container(
          child: TabuleiroWidget(
            tabuleiro: _tabuleiro,
            onAbrir: _abrir,
            onAlternarMarcacao: _alternarMarcacao,
          ),
        ),
      ),
    );
  }
}
