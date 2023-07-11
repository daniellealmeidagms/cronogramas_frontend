import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        hintText: "E-mail",
                        prefixIcon: Icon(Icons.alternate_email)),
                    validator: (value) {
                      if (value!.length < 5) {
                        return "Este e-mail parece curto demais";
                      } else if (!value.contains("@")) {
                        return "Este e-mail não é válido";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "Senha",
                      prefixIcon: Icon(Icons.lock_outline),
                    ),
                    validator: (value) {
                      if (value!.length < 8) {
                        return "Digite uma senha com pelo menos 8 caracteres";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, '/home');
                      }
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.only(top: 25, bottom: 25)),
                    ),
                    child: const Text("Entrar"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: ElevatedButton(
                    onPressed: () {
                      debugPrint("Cadastrar");
                      // Navigator.pushNamed(context, '/cadastro');
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.only(top: 25, bottom: 25)),
                    ),
                    child: const Text("Cadastrar"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: TextButton(
                    child: const Text(
                      "Esqueceu a senha?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "/recoverpass");
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
