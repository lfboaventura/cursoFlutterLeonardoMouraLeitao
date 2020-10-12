import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaDelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaDelecionada++;
    });
  }

  @override
  Widget build(BuildContext context) {

    final perguntas = [
      {
        'texto': 'Qual é a sua cor favorita ?',
        'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco'],
      },
      {
        'texto': 'Qual é o seu animal favorito?',
        'respostas': ['Coelho', 'Cobra', 'Elefante', 'Leão'],
      },
      {
        'texto': 'Qual o instrutor favorito?',
        'respostas': ['Pedro', 'Maria', 'Marlin', 'João'],
      }
    ];

    List<Widget> respostas = [];

    for (String textoResp in perguntas[_perguntaDelecionada]['respostas']) {
      respostas.add(Resposta(textoResp, _responder));
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Column(
          children: [
            Questao(perguntas[_perguntaDelecionada]['texto']),
            ...respostas,
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
