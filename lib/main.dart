import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:interfaz_siiee/features/user_auth/presentation/pages/login_page.dart';
import 'package:interfaz_siiee/features/app/splash_screen/splash_screen.dart';
import 'package:interfaz_siiee/features/user_auth/presentation/pages/sing_up_page.dart';
import 'package:interfaz_siiee/pages/home.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDWHsGW83z9z69TNDFbvOzCvScv-L3x1nI",
            appId: "1:194486201716:web:06d4b37ce43ddef4d01021",
            messagingSenderId: "194486201716",
            projectId: "siiee-flutter"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/home':(context) => const HomePage(),
        '/login':(context) => const LoginPage(),
        '/signup':(context) => const SignUpPage(),
      },
      theme: ThemeData(fontFamily: 'Poppins'),
      home: const SplashScreen(
        child: LoginPage(),
      ),
    );
  }
}
