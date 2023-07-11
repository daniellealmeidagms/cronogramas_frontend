import 'dart:math';
import 'package:cronogramas_front/telas/interacao/listagem/listaaulaslucas.dart';
import 'package:cronogramas_front/telas/autenticacao/recuperarsenha.dart';
import 'package:cronogramas_front/telas/autenticacao/splashscreen.dart';
import 'package:cronogramas_front/telas/inicio/home.dart';
import 'package:cronogramas_front/telas/interacao/cadastro/cadastroaula.dart';
import 'package:cronogramas_front/telas/interacao/cadastro/cadastrocurso.dart';
import 'package:cronogramas_front/telas/interacao/cadastro/cadastrorecesso.dart';
import 'package:cronogramas_front/telas/interacao/cadastro/cadastroturma.dart';
import 'package:cronogramas_front/telas/interacao/cadastro/cadastrounidade.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cronogramas',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: generateMaterialColor(Palette.primary),
      ),
      debugShowCheckedModeBanner: false,
      // Index
      home: const Home(),
      // Páginas Secundárias
      routes: {
        '/recoverpass': (context) => const RecoverPass(),
        '/listaaulas': (context) => const ListaAulas(),
        '/listaaulasdetalhes': (context) => const detalhes[curso](),
        '/home': (context) => const Home(),
        '/createcurso': (context) => const CreateCurso(),
        '/createunidade': (context) => const CreateUnidade(),
        '/createturma': (context) => const CreateTurma(),
        '/createaula': (context) => const CreateAula(),
        '/createrecesso': (context) => const CreateRecesso(),
        '/readallcursos': (context) => const CreateCurso(),
        '/readallunidades': (context) => const CreateUnidade(),
        '/readallturmas': (context) => const CreateTurma(),
        '/readallaulas': (context) => const ReadAllWidget(),
        '/readallrecessos': (context) => const CreateRecesso(),
      },
    );
  }

  MaterialColor generateMaterialColor(Color color) {
    return MaterialColor(color.value, {
      50: tintColor(color, 0.9),
      100: tintColor(color, 0.8),
      200: tintColor(color, 0.6),
      300: tintColor(color, 0.4),
      400: tintColor(color, 0.2),
      500: color,
      600: shadeColor(color, 0.1),
      700: shadeColor(color, 0.2),
      800: shadeColor(color, 0.3),
      900: shadeColor(color, 0.4),
    });
  }

  int tintValue(int value, double factor) =>
      max(0, min((value + ((255 - value) * factor)).round(), 255));

  Color tintColor(Color color, double factor) => Color.fromRGBO(
      tintValue(color.red, factor),
      tintValue(color.green, factor),
      tintValue(color.blue, factor),
      1);

  int shadeValue(int value, double factor) =>
      max(0, min(value - (value * factor).round(), 255));

  Color shadeColor(Color color, double factor) => Color.fromRGBO(
      shadeValue(color.red, factor),
      shadeValue(color.green, factor),
      shadeValue(color.blue, factor),
      1);
}

class Palette {
  // Your hexadecimal color code
  static const Color primary = Color(0xFF004A8D);
}
