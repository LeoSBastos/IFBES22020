import 'package:flutter/material.dart';
import 'package:projeto_final/component/cria_textfield.dart';
import 'package:projeto_final/util/hexcolor.dart';
import 'package:projeto_final/view/cadastro.dart';
import 'package:projeto_final/view/memoriza%C3%A7%C3%A3o.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  _validar(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Memorizacao()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Login", style: TextStyle(color: Colors.white)),
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
            Image(
              image: AssetImage("assets/t1.png"),
              width: 383,
              height: 250,
            ),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: criaTextField("E-mail", _emailController,
                    TextInputType.emailAddress, Icons.account_box)),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _senhaController,
                  obscureText: true,
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock, color: Colors.black),
                    hintText: "Senha",
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
                  _validar(context);
                },
                textColor: Colors.black,
                splashColor: HexColor('ffb2dd'),
                color: Colors.white,
                child: Text(
                  'ENTRAR',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => Cadastro()),
                      (route) => false);
                },
                textColor: Colors.black,
                splashColor: HexColor('ffb2dd'),
                color: Colors.white,
                child: Text(
                  'CADASTRAR-SE',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ]))
        ]));
  }
}
