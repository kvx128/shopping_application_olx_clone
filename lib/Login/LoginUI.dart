import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shopping_application_olx_clone/Services/Auth.dart';
import '../home.dart';
import 'Email_auth.dart';
import 'Phone_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: true,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 48, 52),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: FloatingActionButton(
            onPressed: () async {
              dynamic result = await _auth.signInAnon();
              if (result == null) {
                print('error signing in');
              } else {
                print('signed in');
                print(result.uid);
              }

              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
            child: Icon(
              FontAwesomeIcons.times,
              color: Color.fromARGB(255, 0, 48, 52),
            ),
            backgroundColor: Colors.white,
            elevation: 0),
        body: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: 75,
                    ),
                    SizedBox(
                      child: Image.asset(
                        "assets/images/olx-logo-vector.png",
                        scale: 0.25,
                      ),
                      height: 100,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "INDIA",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 0, 48, 52),
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            dynamic result = await _auth.signInWithGoogle();
                            if (result == null) {
                              print('error signing in');
                            } else {
                              print('signed in');
                              print(result.uid);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.google,
                                color: Color.fromARGB(255, 0, 48, 52),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Text(
                                "Continue with Google",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 48, 52),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.facebookF,
                                color: Color.fromARGB(255, 0, 48, 52),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Text(
                                "Continue with Facebook",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 48, 52),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PhoneLogin()));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.phone_android,
                                color: Color.fromARGB(255, 0, 48, 52),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Text(
                                "Continue with Phone",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 48, 52),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(40, 0, 40, 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "OR",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EmailLogin()));
                                },
                                child: Text(
                                  "Login with Email",
                                  style: TextStyle(
                                      color: Colors.white,
                                      decoration: TextDecoration.underline),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(
                            children: [
                              Text(
                                "If you continue, you are accepting",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "OLX Terms and Conditions and Privacy Policy",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
