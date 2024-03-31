import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodsflutter/pages/login_screen.dart';

import 'package:foodsflutter/pages/home_screen.dart';

import 'auth_page.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        //check if we're logged in?
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          //if has user
          if(snapshot.hasData){
            return HomeScreen();
          }else{
            return AuthPage();
          }
        },
      ),
    );
  }
}
