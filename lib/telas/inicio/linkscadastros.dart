import 'package:flutter/material.dart';

class LinksCadastros extends StatelessWidget {
  const LinksCadastros({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/createcurso");
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    const EdgeInsets.only(top: 25, bottom: 25)),
              ),
              child: const Text("Cadastro de Curso"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/createunidade");
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    const EdgeInsets.only(top: 25, bottom: 25)),
              ),
              child: const Text("Cadastro de Unidade"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/createturma");
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    const EdgeInsets.only(top: 25, bottom: 25)),
              ),
              child: const Text("Cadastro de Turma"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/createaula");
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    const EdgeInsets.only(top: 25, bottom: 25)),
              ),
              child: const Text("Cadastro de Aula"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/createrecesso");
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    const EdgeInsets.only(top: 25, bottom: 25)),
              ),
              child: const Text("Cadastro de Recesso"),
            ),
          ],
        ),
      ),
    );
  }
}
