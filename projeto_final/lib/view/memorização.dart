import 'package:flutter/material.dart';
import 'package:projeto_final/controller/kanji_controller.dart';
import 'package:projeto_final/model/kanji.dart';
import 'package:projeto_final/util/hexcolor.dart';
import 'package:projeto_final/view/resposta.dart';

class Memorizacao extends StatefulWidget {
  int _index;
  Memorizacao(this._index);
  @override
  _MemorizacaoState createState() => _MemorizacaoState();
}

class _MemorizacaoState extends State<Memorizacao> {
  bool _lastKanji = false;
  TextEditingController _traducaoController = new TextEditingController();
  KanjiController _kanjiController = KanjiController();

  _validarResposta(BuildContext context, String resposta) {
    print(resposta == _traducaoController.text);
    bool respostaCorreta = resposta == _traducaoController.text;
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (context) => Resposta(
                resposta,
                (_lastKanji ? widget._index : (widget._index + 1)),
                respostaCorreta)),
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
          FutureBuilder<List<Kanji>>(
              future: _kanjiController.findAll(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Center(
                        child: Text("Carregando dados",
                            style:
                                TextStyle(color: Colors.amber, fontSize: 25.0),
                            textAlign: TextAlign.center));
                  default:
                    if (snapshot.hasError) {
                      return Center(
                          child: Text(
                        "Erro ao carregar dados",
                        style: TextStyle(color: Colors.amber, fontSize: 25.0),
                        textAlign: TextAlign.center,
                      ));
                    } else {
                      Kanji kanji = snapshot.data[widget._index];
                      _lastKanji =
                          ((widget._index + 1) == snapshot.data.length);
                      return SingleChildScrollView(
                          child: Column(children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.fromLTRB(
                                16.0, 52.0, 16.0, 16.0),
                            child: Text(kanji.kanji,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 40),
                                textAlign: TextAlign.center)),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(
                                16.0, 120.0, 16.0, 16.0),
                            child: Text("Digite a Tradução:",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 32))),
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
                                    borderSide:
                                        const BorderSide(color: Colors.black)),
                              ),
                              style: TextStyle(
                                  color: Colors.black, fontSize: 15.0),
                              keyboardType: TextInputType.text,
                            )),
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: FlatButton(
                            onPressed: () {
                              _validarResposta(context, kanji.resposta);
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
                      ]));
                    }
                }
              })
        ]));
  }
}
