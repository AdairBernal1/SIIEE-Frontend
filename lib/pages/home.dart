import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interfaz_siiee/pages/tests/CAT-A/CAT-A_overview.dart';
import 'package:interfaz_siiee/pages/tests/CAT-H/CAT-H_overview.dart';
import 'package:interfaz_siiee/pages/tests/Rorschach/Rorsch_overview.dart';

import '../common/my_signedin_appbar.dart';
import '../features/user_auth/firebase_auth/firebase_auth_services.dart';
import 'tests/TAT/TAT_overview.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Color(0xFFF3A8E4),
            Color(0xFF9ED6FF),
            Color(0xFFC1ED9D),
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: MyAppBar(),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TATOverview()),
                          );
                        },
                        child: const SizedBox(
                          width: 300,
                          height: 100,
                          child: Center(child: Text('Prueba TAT')),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CATAOverview()),
                          );
                        },
                        child: const SizedBox(
                          width: 300,
                          height: 100,
                          child: Center(child: Text('Prueba CAT-A')),
                        ),
                      ),
                    ),
                  ),
                ),
                                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CATHOverview()),
                          );
                        },
                        child: const SizedBox(
                          width: 300,
                          height: 100,
                          child: Center(child: Text('Prueba CAT-H')),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RorschOverview()),
                          );
                        },
                        child: const SizedBox(
                          width: 300,
                          height: 100,
                          child: Center(child: Text('Test de Rorschach')),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
