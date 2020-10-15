import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projeto_final/util/hexcolor.dart';
import 'package:projeto_final/view/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(CardsApp());
}

class CardsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: HexColor('ff80ab'),
        accentColor: HexColor('ffb2dd'),
        buttonTheme: ButtonThemeData(
          buttonColor: HexColor('d6d7d7'),
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Login(),
    );
  }
}
