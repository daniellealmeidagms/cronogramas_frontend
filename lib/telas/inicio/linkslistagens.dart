import 'package:flutter/material.dart';

class LinksListagens extends StatelessWidget {
  const LinksListagens({super.key});

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
                Navigator.pushNamed(context, "/readallcursos");
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    const EdgeInsets.only(top: 25, bottom: 25)),
              ),
              child: const Text("Lista de Cursos"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/readallunidades");
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    const EdgeInsets.only(top: 25, bottom: 25)),
              ),
              child: const Text("Lista de Unidades"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/readallturmas");
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    const EdgeInsets.only(top: 25, bottom: 25)),
              ),
              child: const Text("Lista de Turmas"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/readallaulas");
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    const EdgeInsets.only(top: 25, bottom: 25)),
              ),
              child: const Text("Lista de Aulas"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/readallrecessos");
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    const EdgeInsets.only(top: 25, bottom: 25)),
              ),
              child: const Text("Lista de  Recessos"),
            ),
          ],
        ),
      ),
    );
  }
}
