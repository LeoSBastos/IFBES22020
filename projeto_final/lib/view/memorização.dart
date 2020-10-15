import 'package:flutter/material.dart';
import 'package:projeto_final/util/hexcolor.dart';
import 'package:projeto_final/view/resposta.dart';

class Memorizacao extends StatefulWidget {
  @override
  _MemorizacaoState createState() => _MemorizacaoState();
}

class _MemorizacaoState extends State<Memorizacao> {
  TextEditingController _traducaoController = new TextEditingController();

  _validarResposta(BuildContext context, String resposta) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (context) => Resposta(resposta, respostaCorreta: false)),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Memorização", style: TextStyle(color: Colors.white)),
          automaticallyImplyLeading: false,
        ),
        body: Stack(children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/teladefundo1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
              child: Column(children: <Widget>[
            Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 52.0, 16.0, 16.0),
                child: Text("伯剌西爾",
                    style: TextStyle(color: Colors.black, fontSize: 40),
                    textAlign: TextAlign.center)),
            Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 120.0, 16.0, 16.0),
                child: Text("Digite a Tradução:",
                    style: TextStyle(color: Colors.black, fontSize: 32))),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _traducaoController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Tradução",
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black)),
                  ),
                  style: TextStyle(color: Colors.black, fontSize: 15.0),
                  keyboardType: TextInputType.text,
                )),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: FlatButton(
                onPressed: () {
                  _validarResposta(context, "Brasil");
                },
                textColor: Colors.black,
                splashColor: HexColor('ffb2dd'),
                color: Colors.white,
                child: Text(
                  'CONFIRMAR',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ]))
        ]));
  }
}
