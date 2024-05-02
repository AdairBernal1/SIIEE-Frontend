import "package:flutter/material.dart";
import "package:interfaz_siiee/features/user_auth/firebase_auth/firebase_auth_services.dart";
import "package:interfaz_siiee/features/user_auth/presentation/pages/login_page.dart";
import "package:interfaz_siiee/pages/home.dart";

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => WidgetTreeState();
}

class WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomePage();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
