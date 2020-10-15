class Usuario {
  String id;
  String nome;
  String email;
  String senha;

  Usuario(this.email, this.senha, {this.nome});

  Usuario.fromJson(Map<String, dynamic> json, String idFirebase)
      : nome = json["nome"],
        email = json["email"],
        senha = json["senha"],
        id = idFirebase;

  Map<String, dynamic> toMap() => {
        "nome": nome,
        "email": email,
        "senha": senha,
      };
}
