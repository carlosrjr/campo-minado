import 'package:flutter/material.dart';
import '../components/resultado_widget.dart';
import '../components/campo_widget.dart';
import '../models/campo.dart';
import '../models/explosao_exception.dart';

class CampoMinadoApp extends StatelessWidget {
  void _reiniciar() {
    print('reiniciar...');
  }
  
  _abrir(Campo campo) {
    print('abrir...');
  }
  
  _alternarMarcacao(Campo campo) {
    print('Alternar Marcação...');
  }

  

  @override
  Widget build(BuildContext context) {
    Campo vizinho1 = Campo(linha: 1, coluna: 1);
    vizinho1.minar();
    Campo vizinho2 = Campo(linha: 1, coluna: 0);
    vizinho2.minar();
    Campo vizinho3 = Campo(linha: 3, coluna: 3);
    vizinho3.minar();
  
    Campo campo = Campo(linha: 0, coluna: 0);
    campo.adicionarVizinho(vizinho1);
    campo.adicionarVizinho(vizinho2);
    campo.adicionarVizinho(vizinho3);

    campo.altenarMarcacao();
    try {
      //campo.abrir();
    } on ExplosaoException {}


    return MaterialApp(
      home: Scaffold(
        appBar: ResultadoWidget(
          venceu: true,
          onReiniciar: _reiniciar,
        ),
        body: Container(
          child: CampoWidget(
            campo: campo,
            onAbrir: _abrir(campo),
            onAlternarMarcacao: _alternarMarcacao(campo),
          ),
        ),
      ),
    );
  }
}
