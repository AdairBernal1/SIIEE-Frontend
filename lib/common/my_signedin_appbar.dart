import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interfaz_siiee/features/user_auth/firebase_auth/firebase_auth_services.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  MyAppBar({Key? key}) : super(key: key);

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

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
      leadingWidth: 80,
      leading: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/');
          },
          child: Image.asset('assets/logos/logo-nobg.png')),
      actions: [
        PopupMenuButton(
          itemBuilder: (BuildContext context) => [
            const PopupMenuItem(
              value: 'logout',
              child: Text('Log Out'),
            ),
          ],
          onSelected: (value) {
            if (value == 'logout') {
              signOut();
            }
          },
          tooltip: 'Opciones Usuario',
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SvgPicture.asset(
              'assets/icons/user-avatar.svg',
              width: 70,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
