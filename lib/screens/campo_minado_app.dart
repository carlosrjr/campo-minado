import 'package:campo_minado/components/tabuleiro_widget.dart';
import 'package:campo_minado/models/tabuleiro.dart';
import 'package:flutter/material.dart';
import '../components/resultado_widget.dart';
import '../models/campo.dart';

class CampoMinadoApp extends StatelessWidget {
  void _reiniciar() {
    print('reiniciar...');
  }

  void _abrir(Campo campo) {
    print('abrir...');
  }

  void _alternarMarcacao(Campo campo) {
    print('Alternar Marcação...');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultadoWidget(
          venceu: false,
          onReiniciar: _reiniciar,
        ),
        body: Container(
          child: TabuleiroWidget(
            tabuleiro: Tabuleiro(
              linhas: 5,
              colunas: 5,
              qtdeBombas: 5,
            ),
            onAbrir: _abrir,
            onAlternarMarcacao: _alternarMarcacao,
          ),
        ),
      ),
    );
  }
}
