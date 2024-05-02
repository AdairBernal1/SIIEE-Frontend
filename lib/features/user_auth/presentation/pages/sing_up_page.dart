import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:interfaz_siiee/common/my_app_bar.dart';
import 'package:interfaz_siiee/features/user_auth/firebase_auth/firebase_auth_services.dart';
import 'package:interfaz_siiee/features/user_auth/presentation/pages/login_page.dart';
import 'package:interfaz_siiee/features/user_auth/presentation/widgets/form_container_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final Auth _firebaseAuth = Auth();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: MyAppBar(),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(60.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 27, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      FormContainerWidget(
                        controller: _usernameController,
                        hintText: 'Username',
                        isPasswordField: false,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FormContainerWidget(
                        controller: _emailController,
                        hintText: 'Email',
                        isPasswordField: false,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FormContainerWidget(
                        controller: _passwordController,
                        hintText: 'Password',
                        isPasswordField: true,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: _createUser,
                        child: Container(
                          width: double.infinity,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                              child: Text(
                            'Sign Up',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account?"),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()));
                            },
                            child: const Text('Log in',
                                style: TextStyle(color: Colors.blue)),
                          )
                        ],
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _createUser() async {
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user =
        await _firebaseAuth.createUserWithEmailAndPassword(email, password);

    if (user != null) {
      print("User is succesfully created");
      Navigator.pushNamed(context, "/home");
    } else {
      print("Some error happened");
    }
  }
}
