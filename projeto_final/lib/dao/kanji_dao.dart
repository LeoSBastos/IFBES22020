import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto_final/model/kanji.dart';

class KanjiDao {
  final databaseReference = FirebaseFirestore.instance;
  static const String COLECAO = "kanjis";
  Future<String> inserir(Kanji kanji) async {
    try {
      DocumentReference ref =
          await databaseReference.collection(COLECAO).add(kanji.toMap());
      return ref.id;
    } catch (e) {
      return e.toString();
    }
  }

  Future<List<Kanji>> findAll() async {
    QuerySnapshot cursos = await databaseReference.collection(COLECAO).get();
    List<Kanji> listaKanji = List();
    cursos.docs.forEach((elemento) {
      listaKanji.add(Kanji.fromJson(elemento.data(), elemento.id));
    });
    return listaKanji;
  }
}
