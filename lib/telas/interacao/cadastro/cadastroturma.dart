import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CreateTurma extends StatefulWidget {
  const CreateTurma({super.key});

  @override
  State<CreateTurma> createState() => _CreateTurmaState();
}

class _CreateTurmaState extends State<CreateTurma> {
  final _formkey = GlobalKey<FormState>();

  final TextEditingController _datainiciocontroller = TextEditingController();
  final TextEditingController _datafinalcontroller = TextEditingController();
  final TextEditingController _horasaulacontroller = TextEditingController();
  final TextEditingController _cursocontroller = TextEditingController();
  String? _selectedTurno;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastrar Turma"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Center(
            child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(children: [
              // Input Turno
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: "Turno: ",
                  prefixIcon: Icon(Icons.wb_sunny_outlined),
                ),
                value: _selectedTurno,
                onChanged: (String? value) {
                  setState(() {
                    _selectedTurno = value;
                  });
                },
                items: const [
                  DropdownMenuItem<String>(
                    value: "Matutino",
                    child: Text("Matutino"),
                  ),
                  DropdownMenuItem<String>(
                    value: "Vespertino",
                    child: Text("Vespertino"),
                  ),
                  DropdownMenuItem<String>(
                    value: "Noturno",
                    child: Text("Noturno"),
                  ),
                ],
              ),

              // Input Data Início
              DateTimeField(
                controller: _datainiciocontroller,
                decoration: const InputDecoration(
                  labelText: "Inicio do Curso: ",
                  filled: true,
                  prefixIcon: Icon(Icons.calendar_today),
                ),
                format: DateFormat("dd/MM/yyyy"),
                onShowPicker: (context, currentValue) {
                  return showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                },
                validator: (value) {
                  if (value == null) {
                    return "Campo Obrigatorio";
                  }
                },
              ),

              // Input Data Final
              DateTimeField(
                controller: _datafinalcontroller,
                decoration: const InputDecoration(
                  labelText: "Final do Curso: ",
                  filled: true,
                  prefixIcon: Icon(Icons.calendar_month_sharp),
                ),
                format: DateFormat("dd/MM/yyyy"),
                onShowPicker: (context, currentValue) {
                  return showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                },
                validator: (value) {
                  if (value == null) {
                    return "Campo Obrigatorio";
                  }
                },
              ),

              // Horas de aula por dia
              TextFormField(
                controller: _horasaulacontroller,
                decoration: const InputDecoration(
                  labelText: "Horas de aula por dia: ",
                  prefixIcon: Icon(Icons.access_time_filled),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Campo obrigatório";
                  }
                },
              ),

              // Curso
              TextFormField(
                controller: _cursocontroller,
                decoration: const InputDecoration(
                    labelText: "Curso: ",
                    prefixIcon: Icon(Icons.assignment_ind_rounded)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Campo obrigatório";
                  }
                },
              ),

              // Botão Salvar
              ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      Fluttertoast.showToast(
                          msg: "Turma cadastrada com sucesso!",
                          gravity: ToastGravity.CENTER_LEFT,
                          backgroundColor: Colors.green);
                    }
                  },
                  child: const Text("Salvar Turma")),
            ]),
          ),
        )),
      ),
    );
  }
}
