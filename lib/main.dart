import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

void main() {
  runApp(const PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({Key? key}) : super(key: key);

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Azul', 'pontuacao': 9},
        {'texto': 'Amarelo', 'pontuacao': 7},
        {'texto': 'Roxo', 'pontuacao': 6},
        {'texto': 'Vermelho', 'pontuacao': 8},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Cachorro', 'pontuacao': 4},
        {'texto': 'Coelho', 'pontuacao': 8},
        {'texto': 'Leão', 'pontuacao': 3},
        {'texto': 'Zebra', 'pontuacao': 9},
      ],
    },
    {
      'texto': 'Qual é o seu País favorito?',
      'respostas': [
        {'texto': 'Brasil', 'pontuacao': 4},
        {'texto': 'China', 'pontuacao': 10},
        {'texto': 'Estados Unidos', 'pontuacao': 6},
        {'texto': 'Rússia', 'pontuacao': 5},
      ],
    },
    {
      'texto': 'Qual sua comida favorita?',
      'respostas': [
        {'texto': 'Lasanha', 'pontuacao': 4},
        {'texto': 'Feijoada', 'pontuacao': 7},
        {'texto': 'Maniçoba', 'pontuacao': 2},
        {'texto': 'Panqueca', 'pontuacao': 6},
      ],
    },
    {
      'texto': 'Qual seu estilo musical favorito?',
      'respostas': [
        {'texto': 'Rock', 'pontuacao': 9},
        {'texto': 'Pagode', 'pontuacao': 6},
        {'texto': 'Funk', 'pontuacao': 1},
        {'texto': 'Forró', 'pontuacao': 8},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Center(
            child: Text(
              'Perguntas',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}
