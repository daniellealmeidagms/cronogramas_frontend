import 'package:cronogramas_front/telas/inicio/linkscadastros.dart';
import 'package:cronogramas_front/telas/inicio/linkslistagens.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  List<Widget> screens = [
    LinksCadastros(),
    LinksListagens(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "images/senac_logo_branco.png",
          width: 110,
          height: 35,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Sair',
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
        ],
      ),
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              label: "Cadastros",
              icon: Icon(Icons.add),
            ),
            BottomNavigationBarItem(
              label: "Listagens",
              icon: Icon(Icons.list_alt),
            ),
          ]),
    );
  }
}
