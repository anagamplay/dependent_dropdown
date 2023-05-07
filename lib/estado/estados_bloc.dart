import 'dart:async';
import 'package:dependent_dropdown/estado/estado.dart';
import 'package:dependent_dropdown/estado/estados_api.dart';
import 'package:dependent_dropdown/utils/simple_bloc.dart';

class EstadosBloc extends SimpleBloc<List<Estado>>{
  Future<List<Estado>> fetch() async {
    try {
      List<Estado> estados = await EstadosApi.getEstados();

      add(estados);

      return estados;
    } catch (e) {
      addError(e);
    }

    return [];
  }
}