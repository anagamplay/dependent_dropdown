import 'dart:async';
import 'package:dependent_dropdown/cidade/cidade.dart';
import 'package:dependent_dropdown/cidade/cidades_api.dart';
import 'package:dependent_dropdown/utils/simple_bloc.dart';

class CidadesBloc extends SimpleBloc<List<Cidade>>{
  Future<List<Cidade>> fetch(String uf) async {
    try {
      //print("UF: $uf");
      List<Cidade> cidades = await CidadesApi.getCidadesByUF(uf);

      //cidades.map((e) => print("Cidade: ${e.nome}")).toString();

      add(cidades);

      return cidades;
    } catch (e) {
      addError(e);
    }

    return [];
  }
}