import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lbp/pages/home_page.dart';
import 'package:lbp/services/auth/login_or_register.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapShot){
                  //usser logged
        if(snapShot.hasData){
          return const HomePage();
        }

        //user not logged
        else {
          return const LoginOrRegister();
        }
        },

        ),
    );
  }
}