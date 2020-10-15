class Kanji {
  String id;
  String kanji;
  String resposta;
  Kanji(this.kanji, this.resposta);

  Kanji.fromJson(Map<String, dynamic> json, String idFirebase)
      : kanji = json["kanji"],
        resposta = json["resposta"],
        id = idFirebase;

  Map<String, dynamic> toMap() => {
        "kanji": kanji,
        "resposta": resposta,
      };
}
