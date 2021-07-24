import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 0, 48, 52),
        child: Center(
          child: Image.asset("assets/images/logo.png",scale: 1.0,),
        ),
      ),
    );
  }
}