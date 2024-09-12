import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:interfaz_siiee/pages/tests/Rorschach/Rorsch_test.dart';

class RorschOverview extends StatefulWidget {
  const RorschOverview({Key? key}) : super(key: key);

  @override
  State<RorschOverview> createState() => _RorschOverviewState();
}

class _RorschOverviewState extends State<RorschOverview> {
  final double _toolbarHeight = 65;
  Future<String>? _future;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(232, 57, 137, 203),
          title: Center(
            child: SizedBox(
              height: _toolbarHeight,
              child: Image.asset(
                'assets/logos/logo-nobg.png',
              ),
            ),
          ),
          toolbarHeight: _toolbarHeight,
        ),
        body: Stack(children: [
          Column(
            children: [
              Row(
                children: const [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Test de Rorschach',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: const [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'Edades de aplicacion : Mayores de 5 años       -       Duracion maxima: 25 minutos',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  """
El test de Rorschach es una técnica proyectiva que tiene como objetivo principal investigar y conocer todos los rincones de la mente del hombre, desde las ideas más evidentes hasta los miedos más profundos, fue diseñado con el propósito de arrojar un poco de luz a los secretos ocultos de la identidad de las personas, características y traumas de la infancia a los que quizás no se había accedido hasta entonces. Gracias a este tipo de tests psicológicos se puede acceder a partes de la mente más difíciles de analizar a primera vista.  (iProfesional, 2023)""",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                      fontStyle: FontStyle.normal),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Rorsch_test()),
                    );
                  },
                  child: const Text('Iniciar Evaluacion'),
                )),
          ),
        ]));
  }
}
