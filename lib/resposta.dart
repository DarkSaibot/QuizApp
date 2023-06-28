import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() onSelected;

  Resposta(this.texto, this.onSelected);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.teal),
        child: Text(
          texto,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        onPressed: onSelected,
      ),
    );
  }
}
