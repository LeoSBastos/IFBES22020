import 'package:flutter/material.dart';
import 'package:projeto_final/util/hexcolor.dart';
import 'package:projeto_final/view/memoriza%C3%A7%C3%A3o.dart';

class Resposta extends StatefulWidget {
  final bool respostaCorreta;
  String _resposta;
  Resposta(_resposta, {this.respostaCorreta});
  @override
  _RespostaState createState() => _RespostaState();
}

class _RespostaState extends State<Resposta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Resposta", style: TextStyle(color: Colors.white)),
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
                padding: const EdgeInsets.fromLTRB(125.0, 52.0, 16.0, 16.0),
                child: Text("Resposta:",
                    style: TextStyle(color: Colors.black, fontSize: 32),
                    textAlign: TextAlign.center)),
            Padding(
                padding: const EdgeInsets.fromLTRB(125.0, 120.0, 16.0, 16.0),
                child: Text(widget._resposta,
                    style: TextStyle(color: Colors.black, fontSize: 65))),
            Padding(
              padding: const EdgeInsets.fromLTRB(125.0, 150.0, 16.0, 16.0),
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => Memorizacao()),
                      (route) => false);
                },
                textColor: Colors.black,
                splashColor: HexColor('ffb2dd'),
                color: Colors.white,
                child: Text(
                  'PRÓXIMO KANJI',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ]))
        ]));
  }
}
