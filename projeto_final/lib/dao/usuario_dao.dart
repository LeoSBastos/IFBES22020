import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto_final/model/usuario.dart';

class UsuarioDao {
  final databaseReference = FirebaseFirestore.instance;
  static const String COLECAO = "usuarios";
  Future<String> inserir(Usuario usuario) async {
    try {
      DocumentReference ref =
          await databaseReference.collection(COLECAO).add(usuario.toMap());
      return ref.id;
    } catch (e) {
      return e.toString();
    }
  }

  Future<bool> validateUser(Usuario usuario) async {
    QuerySnapshot usuarios = await databaseReference
        .collection(COLECAO)
        .where('email', isEqualTo: usuario.email)
        .get();
    print(usuarios.docs[0].data());
    return usuarios.docs[0].data()['senha'] == usuario.senha;
  }
}
