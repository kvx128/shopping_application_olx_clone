// import 'package:brew_crew/screens/authenticate/authenticate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_application_olx_clone/Login/LoginUI.dart';
import 'home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usr = Provider.of<User?>(context);
    print(usr);
    // return either the Home or Authenticate widget
    if (usr == null) {
      return LoginScreen();
    } else {
      return Home();
    }
  }
}
