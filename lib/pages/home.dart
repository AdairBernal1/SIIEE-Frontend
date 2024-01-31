import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../common/my_app_bar.dart';
import '../features/user_auth/firebase_auth/firebase_auth_services.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

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
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        appBar: MyAppBar(),
      ),
    );
  }
}
