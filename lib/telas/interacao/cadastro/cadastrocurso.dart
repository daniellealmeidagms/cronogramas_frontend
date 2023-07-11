import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CreateCurso extends StatefulWidget {
  const CreateCurso({super.key});

  @override
  State<CreateCurso> createState() => _CreateCursoState();
}

class _CreateCursoState extends State<CreateCurso> {
  // Variáveis de estado (Acima da @override, no 'método build')
  // As variáveis de estado por padrão começam com '_' (_nomedavariavel)
  // Ao se trabalhar com variáveis utiliza-se a classe 'StatefulWidget'

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _descricaocontroller = TextEditingController();
  final TextEditingController _cargahorariacontroller = TextEditingController();
  String? _selectedModalidade;
  String? _selectedEixo;

  @override // Anotação de subscrita... sobrescrevendo o método que foi definido na classe mãe.
  Widget build(BuildContext context) {
    return Scaffold(
      //É equivalente a tag <body> do html
      appBar: AppBar(
        title: const Text("Cadastrar Curso"),
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
                    keyboardType: TextInputType.text,
                    controller: _descricaocontroller,
                    decoration: const InputDecoration(
                      labelText: "Descrição do curso: ",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Campo Obrigatório";
                      }
                    },
                  ),

                  // Input carga horária
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _cargahorariacontroller,
                    decoration: const InputDecoration(
                      labelText: "Carga Horária: ",
                    ),
                    validator: (value) {},
                  ),

                  // Input modalidade
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: "Modalidade: ",
                    ),
                    value: _selectedModalidade,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedModalidade = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Selecione uma modalidade";
                      }
                    },
                    items: const [
                      DropdownMenuItem<String>(
                        value: "Qualificação",
                        child: Text("Qualificação"),
                      ),
                      DropdownMenuItem<String>(
                        value: "Aperfeiçoamento",
                        child: Text("Aperfeiçoamento"),
                      ),
                      DropdownMenuItem<String>(
                        value: "Técnico",
                        child: Text("Técnico"),
                      ),
                      DropdownMenuItem<String>(
                        value: "Graduação",
                        child: Text("Graduação"),
                      ),
                      DropdownMenuItem<String>(
                        value: "Pós-Graduação ",
                        child: Text("Pós-Graduação "),
                      ),
                    ],
                  ),

                  // Input eixo
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: "Eixo: ",
                    ),
                    value: _selectedEixo,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedEixo = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Selecione um Eixo";
                      }
                    },
                    items: const [
                      DropdownMenuItem<String>(
                        value: "TI",
                        child: Text("TI"),
                      ),
                      DropdownMenuItem<String>(
                        value: "Gestão",
                        child: Text("Gestão"),
                      ),
                      DropdownMenuItem<String>(
                        value: "Beleza",
                        child: Text("Beleza"),
                      ),
                    ],
                  ),

                  // Botão Salvar
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Fluttertoast.showToast(
                              msg: "Curso cadastrado com sucesso!",
                              gravity: ToastGravity.CENTER_LEFT,
                              backgroundColor: Colors.green);
                        }
                      },
                      child: const Text("Salvar Curso"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
