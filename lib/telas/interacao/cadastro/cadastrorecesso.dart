import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class CreateRecesso extends StatefulWidget {
  const CreateRecesso({Key? key}) : super(key: key);

  @override
  _CreateRecessoState createState() => _CreateRecessoState();
}

class _CreateRecessoState extends State<CreateRecesso> {
  final _formKey = GlobalKey<FormState>();
  final format = DateFormat("dd-MM-yyyy");
  final TextEditingController _datacontroller = TextEditingController();
  final TextEditingController _descricaocontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastrar Recesso"),
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
                    controller: _descricaocontroller,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: "Informe o motivo do recesso: ",
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(15, 15))),
                      prefixIcon: Icon(Icons.airplanemode_active),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Campo Obrigatório!";
                      }
                      return null;
                    },
                  ),

                  // Input Data
                  DateTimeField(
                    controller: _datacontroller,
                    format: format,
                    onShowPicker: (context, currentValue) {
                      return showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2100),
                      );
                    },
                    decoration: const InputDecoration(
                      labelText: "Informe a data do recesso: ",
                      prefixIcon: Icon(Icons.calendar_month),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(15, 15))),
                    ),
                  ),

                  // Botão Salvar
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Fluttertoast.showToast(
                          msg: "Recesso cadastrado com sucesso!",
                          gravity: ToastGravity.TOP_RIGHT,
                          backgroundColor: Colors.green,
                        );
                      }
                    },
                    child: const Text('Salvar Recesso'),
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
