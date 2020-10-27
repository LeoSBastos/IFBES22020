import 'package:flutter/material.dart';
import 'package:projeto_final/component/cria_textfield.dart';
import 'package:projeto_final/controller/usuario_controller.dart';
import 'package:projeto_final/model/usuario.dart';
import 'package:projeto_final/util/hexcolor.dart';
import 'package:projeto_final/view/login.dart';
import 'package:projeto_final/view/memoriza%C3%A7%C3%A3o.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  TextEditingController _confirmarSenhaController = TextEditingController();
  UsuarioController _userController = UsuarioController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  _validar(BuildContext context) {
    Usuario user = Usuario(_emailController.text, _senhaController.text,
        nome: _nomeController.text);
    _userController.salvar(user);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Memorizacao(0)),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Cadastro", style: TextStyle(color: Colors.white)),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              setState(() {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => Login()),
                    (route) => false);
              });
            },
          ),
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
            Text("Cadastro",
                style: TextStyle(color: Colors.black, fontSize: 40)),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: criaTextField("Nome", _nomeController,
                    TextInputType.emailAddress, Icons.account_box)),
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
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _confirmarSenhaController,
                  obscureText: true,
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock, color: Colors.black),
                    hintText: "Confirmar Senha",
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
                  'CADASTRAR-SE',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ]))
        ]));
  }
}
