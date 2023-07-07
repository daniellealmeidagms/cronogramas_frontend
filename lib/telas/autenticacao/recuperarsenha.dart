import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RecoverPass extends StatefulWidget {
  const RecoverPass({Key? key}) : super(key: key);

  @override
  _RecoverPassState createState() => _RecoverPassState();
}

class _RecoverPassState extends State<RecoverPass> {
  TextEditingController _emailController = TextEditingController();

  // FirebaseAuth auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recuperar Senha"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // --- Campo E-mail ---
                  Padding(
                    padding: EdgeInsets.fromLTRB(3, 15, 3, 15),
                    child: TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.length < 5) {
                          return "Este e-mail parece curto demais";
                        } else if (!value.contains("@")) {
                          return "Este e-mail não é válido";
                        }
                      },
                      decoration: InputDecoration(
                        labelText: "E-mail para recuperar senha",
                        prefixIcon: Icon(Icons.alternate_email),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pop(context);
                          Fluttertoast.showToast(
                            msg: "Acesse seu e-mail para redefinir a senha.",
                            gravity: ToastGravity.CENTER,
                            backgroundColor: Colors.green,
                          );
                        }
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.only(top: 25, bottom: 25)),
                      ),
                      child: const Text("Enviar"),
                    ),
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
