import 'package:projeto_final/dao/kanji_dao.dart';
import 'package:projeto_final/model/kanji.dart';

class KanjiController {
  KanjiDao kanjiDao = KanjiDao();
  Future<String> salvar(Kanji usuario) {
    return kanjiDao.inserir(usuario);
  }

  Future<List<Kanji>> findAll() async {
    return kanjiDao.findAll();
  }
}
