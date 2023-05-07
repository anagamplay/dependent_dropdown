class Estado {
  int? id;
  String? sigla;
  String? nome;
  Regiao? regiao;

  Estado({this.id, this.sigla, this.nome, this.regiao});

  Estado.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    sigla = json['sigla'];
    nome = json['nome'];
    regiao =
    json['regiao'] != null ? new Regiao.fromMap(json['regiao']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sigla'] = this.sigla;
    data['nome'] = this.nome;
    if (this.regiao != null) {
      data['regiao'] = this.regiao!.toMap();
    }
    return data;
  }
}

class Regiao {
  int? id;
  String? sigla;
  String? nome;

  Regiao({this.id, this.sigla, this.nome});

  Regiao.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    sigla = json['sigla'];
    nome = json['nome'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sigla'] = this.sigla;
    data['nome'] = this.nome;
    return data;
  }
}