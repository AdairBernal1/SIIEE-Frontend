import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:interfaz_siiee/pages/tests/CAT-A/CAT-A_test.dart';

class CATAOverview extends StatefulWidget {
  const CATAOverview({Key? key}) : super(key: key);

  @override
  State<CATAOverview> createState() => _CATAOverviewState();
}

class _CATAOverviewState extends State<CATAOverview> {
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
                        'Test de Apercepcion Infantil (Animales)',
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
El Test de Apercepción Infantil (CAT) es una prueba proyectiva de personalidad diseñada para niños de tres a diez años, desarrollada por Leopold y Sonya Sorel Bellak. Utiliza imágenes de animales en situaciones humanas para que los niños creen historias sobre los personajes en las imágenes. Su propósito es evaluar rasgos de personalidad, actitudes y procesos psicodinámicos en los niños. Existen dos versiones: CAT-A (animales) y CAT-H (humanos). Esta prueba ayuda a comprender las perturbaciones emocionales, el desarrollo de la personalidad y las interacciones sociales en los niños.""",
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
                          MaterialPageRoute(builder: (context) => const CATAtest()),
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
