import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateAula extends StatefulWidget {
  const CreateAula({super.key});
  @override
  State<CreateAula> createState() => _CreateAulaState();
}

class _CreateAulaState extends State<CreateAula> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dataController = TextEditingController();
  final TextEditingController _turmaController = TextEditingController();
  final TextEditingController _unidadeController = TextEditingController();
  final TextEditingController _dropController = TextEditingController();
  final format = DateFormat('dd-mm-yyyy');
  String dropdownValue = 'Pendente';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Aula'),
      ),
      body: Container(
        padding: const EdgeInsets.all(40),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // Data Aula
                  DateTimeField(
                    decoration: const InputDecoration(
                        icon: Icon(Icons.lock_clock_outlined),
                        border: OutlineInputBorder()),
                    controller: _dataController,
                    format: format,
                    validator: (value) {
                      if (value == null) {
                        return 'Campo Obrigatorio!';
                      } else {
                        return null;
                      }
                    },
                    onShowPicker: (context, currentValue) {
                      return showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2100),
                      );
                    },
                  ),
                  // Status Aula
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      items: <String>['Pendente', 'Ministrada', 'Cancelada']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(fontSize: 19),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = _dropController.text = newValue!;
                        });
                      },
                    ),
                  ),
                  // Turma
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    child: TextFormField(
                      controller: _turmaController,
                      decoration: const InputDecoration(
                          labelText: 'Turma',
                          icon: Icon(Icons.people),
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Obrigatorio!';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  // Unidade
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    child: TextFormField(
                      controller: _unidadeController,
                      decoration: const InputDecoration(
                          labelText: 'Unidade',
                          icon: Icon(Icons.abc),
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Obrigatorio!';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _showDialog(context);
                          }
                        },
                        child: const Text('Salvar Aula')),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void _showDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          "Alerta!!",
          style: TextStyle(color: Colors.black),
        ),
        content: const Text("Aula Cadastrada Com Sucesso"),
        titleTextStyle: const TextStyle(
          fontSize: 30,
        ),
        actions: <Widget>[
          FloatingActionButton(
            child: const Text(
              "Ok",
              style: TextStyle(
                fontSize: 19,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
