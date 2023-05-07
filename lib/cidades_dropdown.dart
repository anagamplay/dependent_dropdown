import 'package:dependent_dropdown/cidade/cidades_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';

class CidadesDropdown {
  static fetch(String uf) {
    return CidadesBloc().fetch(uf);
  }
}