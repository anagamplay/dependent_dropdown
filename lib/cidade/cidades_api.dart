import 'package:dependent_dropdown/cidade/cidade.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class CidadesApi {
  static Future<List<Cidade>> getCidadesByUF(String uf) async {
    Uri url = Uri.parse("https://servicodados.ibge.gov.br/api/v1/localidades/estados/$uf/municipios");

    var response = await http.get(url);
    String json = response.body;
    List list = convert.json.decode(json);

    List<Cidade> cidade = list.map<Cidade>((map) => Cidade.fromMap(map)).toList();

    return cidade;
  }
}