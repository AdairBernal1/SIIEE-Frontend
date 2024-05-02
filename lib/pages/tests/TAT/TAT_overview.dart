import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:interfaz_siiee/pages/tests/TAT/TAT_test.dart';

class TATOverview extends StatefulWidget {
  const TATOverview({Key? key}) : super(key: key);

  @override
  State<TATOverview> createState() => _TATOverviewState();
}

class _TATOverviewState extends State<TATOverview> {
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
      body: Stack(
        children: [
          Column(
            children: [
              Row(
                children: const [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Test de Apercepcion Tematica',
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
EL TEST DE APERCEPCIÓN TEMÁTICA (TAT) es un test proyectivo que aparece en las baterías psicodiagnósticas en 1935 inventado por Henry Murray y Christiana Morgan, aunque la serie de láminas que se emplea actualmente data de 1943. La prueba consiste en mostrar al examinado una colección de láminas que reproducen escenas dramáticas que, por sus contornos imprecisos, su impresión difusa o su tema inexplícito, son lo suficientemente ambiguas como para provocar la proyección de la realidad íntima del sujeto a través de sus interpretaciones preceptúales, mnésicas e imaginativas.""",
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
                          MaterialPageRoute(builder: (context) => const TATtest()),
                        );
                      },
                      child: const Text('Iniciar Evaluacion'),
                    )
              ),
      ),
        ])
    );
  }
}
