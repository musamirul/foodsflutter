import 'package:flutter/material.dart';
import 'package:foodsflutter/pages/login_screen.dart';
import 'package:foodsflutter/pages/register_screen.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  //boolean initally, show the login page

  void toggleScreens(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }
  bool showLoginPage = true;
  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginScreen(showRegisterPage: toggleScreens,);
    }else{
      return RegisterScreen(showLoginPage: toggleScreens,);
    }
  }
}
