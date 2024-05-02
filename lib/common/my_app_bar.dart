import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Sistema Inteligente de Identificacion y Evaluacion Emocional',
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      leading: Image.asset('assets/logos/logo-nobg.png'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}