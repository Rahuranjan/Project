import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:project/screen/exercises.dart';
// import 'package:project/screen/login_screen.dart';

import 'package:project/screen/signup_screen.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          //user is logged in
          if(snapshot.hasData){
            return const SignUpScreen();
          }
          //user is not logged in
          else {
            return const SignUpScreen();
          }
        },
      ),
    );
  }
}