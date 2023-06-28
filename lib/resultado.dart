import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;
  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 18) {
      return 'PARABÉNS!';
    } else if (pontuacao < 24) {
      return 'Você é MUITO BOM!';
    } else if (pontuacao < 35) {
      return 'IMPRESSIONANTE!';
    } else {
      return 'Nível MESTRE DOS MESTRES!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text('Você fez $pontuacao pontos e sua classificação é:\n\n',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              )),
        ),
        Center(
          child: Text(
            fraseResultado,
            style: const TextStyle(
              fontSize: 40,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          margin: const EdgeInsets.all(20.0),
          child: TextButton(
            onPressed: quandoReiniciarQuestionario,
            child: const Text("Jogar Novamente"),
            style: TextButton.styleFrom(
              backgroundColor: Colors.teal,
              primary: Colors.white,
              textStyle: const TextStyle(fontSize: 25),
            ),
          ),
        ),
      ],
    );
  }
}
