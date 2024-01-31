import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              // Perform logout action here
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SvgPicture.asset(
              'assets/icons/user-avatar.svg',
              width: 70,
            ),
          ),
          tooltip: 'Opciones Usuario',
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
