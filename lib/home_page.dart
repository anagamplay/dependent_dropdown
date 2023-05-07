import 'package:dependent_dropdown/cidade/cidade.dart';
import 'package:dependent_dropdown/cidade/cidades_bloc.dart';
import 'package:dependent_dropdown/estado/estado.dart';
import 'package:dependent_dropdown/estado/estados_bloc.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _blocEstados = EstadosBloc();
  final _blocCidades = CidadesBloc();

  String? estado;
  String? cidade;

  bool? estadoSeleted;

  @override
  void initState() {
    super.initState();

    _blocEstados.fetch();

    estadoSeleted = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dependent Dropdown"),
      ),
      body: _body(),
    );
  }

  _body() {
    final List<Estado> listEstados = [];
    final List<Cidade> listCidades = [];

    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          StreamBuilder(
            stream: _blocEstados.stream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('[ERRO]Não foi possível buscar os carros');
              }

              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              List<Estado> estados = snapshot.data as List<Estado>;

              listEstados.addAll(estados);

              return DropdownButton(
                hint: const Text("Estado"),
                items: listEstados.map((e) {
                  return DropdownMenuItem<String>(
                    value: e.nome,
                    child: Text(e.nome as String),
                  );
                }).toList(),
                value: estado,
                onChanged: (value) {
                  setState(
                    () {
                      estado = value!;

                      for (int i = 0; i < listEstados.length; i++) {
                        if (listEstados[i].nome == value) {
                          _blocCidades.fetch(listEstados[i].sigla as String);
                        }
                      }

                      cidade = null;
                      estadoSeleted = true;
                    },
                  );
                },
              );
            },
          ),
          StreamBuilder(
            stream: estadoSeleted == true ? _blocCidades.stream : null,
            builder: (context, snapshot) {
              if (estadoSeleted == true) {
                if (snapshot.hasError) {
                  return Text('[ERRO]Não foi possível buscar os carros');
                }

                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                List<Cidade> cidades = snapshot.data as List<Cidade>;

                if (listCidades.isNotEmpty) {
                  listCidades.clear();
                  //print(">>>>>List Cidades: $listCidades");
                }
                listCidades.addAll(cidades);
                //listCidades.map((e) => print(">List Cidades: ${e.nome}")).toString();

                return DropdownButton(
                  hint: const Text("Cidade"),
                  items: listCidades.map((e) {
                    return DropdownMenuItem<String>(
                        value: e.nome, child: Text(e.nome as String));
                  }).toList(),
                  value: cidade,
                  onChanged: (value) {
                    setState(() {
                      cidade = value!;
                    });
                  },
                );
              }

              return DropdownButton(
                hint: const Text("Cidade"),
                items: [],
                onChanged: null,
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  dispose() {
    super.dispose();
    _blocEstados.dispose();
    _blocCidades.dispose();
  }
}
