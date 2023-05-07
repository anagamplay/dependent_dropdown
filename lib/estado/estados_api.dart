import 'package:dependent_dropdown/estado/estado.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class EstadosApi {
  static Future<List<Estado>> getEstados() async {

    Uri url = Uri.parse("https://servicodados.ibge.gov.br/api/v1/localidades/estados");

    print("GET > $url");

    var response = await http.get(url);

    String json = response.body;

    List list = convert.json.decode(json);

    List<Estado> estados = list.map<Estado>((map) => Estado.fromMap(map)).toList();

    return estados;
  }
}