import 'package:projeto_final/dao/usuario_dao.dart';
import 'package:projeto_final/model/usuario.dart';

class UsuarioController {
  UsuarioDao usuarioDao = UsuarioDao();
  Future<String> salvar(Usuario usuario) {
    return usuarioDao.inserir(usuario);
  }

  Future<bool> validateUser(Usuario usuario) async {
    return usuarioDao.validateUser(usuario);
  }
}
