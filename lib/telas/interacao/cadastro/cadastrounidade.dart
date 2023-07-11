import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class CreateUnidade extends StatefulWidget {
  const CreateUnidade({Key? key}) : super(key: key);

  @override
  _CreateUnidadeState createState() => _CreateUnidadeState();
}

class _CreateUnidadeState extends State<CreateUnidade> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _descricaoUnidade = TextEditingController();
  final TextEditingController _cargaHorariaUnidade = TextEditingController();
  final TextEditingController _ordem = TextEditingController();
  final TextEditingController _fkcurso = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastrar Unidade"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  
                  // Input Descrição
                  TextFormField(
                    controller: _descricaoUnidade,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        labelText: "Descrição da unidade:",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(15, 15))),
                        prefixIcon: Icon(Icons.abc)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Campo Obrigatório!";
                      }
                      return null;
                    },
                  ),

                  // Input carga horária
                  TextFormField(
                    controller: _cargaHorariaUnidade,
                    decoration: const InputDecoration(
                        labelText: "Carga Horária da unidade:",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(15, 15))),
                        prefixIcon: Icon(Icons.access_alarms)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Campo Obrigatório!";
                      }
                      final cargaHoraria = int.tryParse(value);
                      if (cargaHoraria != null && cargaHoraria <= 0) {
                        _cargaHorariaUnidade.clear();
                        return "O valor deve ser maior que 0!";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),

                  // Input ordem
                  TextFormField(
                    controller: _ordem,
                    decoration: const InputDecoration(
                        labelText: "Ordem da unidade:",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(15, 15))),
                        prefixIcon: Icon(Icons.format_list_numbered)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Campo Obrigatório!";
                      }
                      final ordem = int.tryParse(value);
                      if (ordem != null && ordem <= 0) {
                        _ordem.clear();
                        return "O valor deve ser maior que 0!";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),

                  // Input curso
                  TextFormField(
                    controller: _fkcurso,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        labelText: "Curso da unidade:",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(15, 15))),
                        prefixIcon: Icon(Icons.bookmark_add_outlined)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Campo Obrigatório!";
                      }
                      return null;
                    },
                  ),

                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Fluttertoast.showToast(
                          msg: "Unidade cadastrada com sucesso!",
                          gravity: ToastGravity.TOP_RIGHT,
                          backgroundColor: Colors.green,
                        );
                      }
                    },
                    child: const Text('Salvar Unidade'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
