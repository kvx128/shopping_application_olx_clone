import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopping_application_olx_clone/home.dart';
import 'package:shopping_application_olx_clone/services/Auth.dart';

class EmailLogin extends StatefulWidget {
  EmailLogin({Key? key}) : super(key: key);

  @override
  _EmailLoginState createState() => _EmailLoginState();
}

class _EmailLoginState extends State<EmailLogin> {
  String email = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Login",
            style: TextStyle(
              color: Color.fromARGB(255, 0, 48, 52),
            ),
          ),
          backgroundColor: Colors.white54,
        ),
        body: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/images/userAvatar.png"),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Enter your email to login",
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 48, 52), fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        email = value.toLowerCase();
                      });
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 0, 48, 52),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 200,
                  ),
                  Row(children: [
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PasswordScreen(
                                      email: email,
                                    )));
                      },
                      child: Text(
                        "Next",
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 0, 48, 52)),
                    )),
                  ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PasswordScreen extends StatefulWidget {
  PasswordScreen({Key? key, required this.email}) : super(key: key);
  final String email;

  @override
  _PasswordScreenState createState() => _PasswordScreenState(email);
}

class _PasswordScreenState extends State<PasswordScreen> {
  _PasswordScreenState(this.email);
  String pswd = "";
  String email;
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Password",
            style: TextStyle(
              color: Color.fromARGB(255, 0, 48, 52),
            ),
          ),
          backgroundColor: Colors.white54,
        ),
        body: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/images/userAvatar.png"),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Enter your password to login",
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 48, 52), fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        pswd = value;
                      });
                    },
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 0, 48, 52),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 200,
                  ),
                  Row(children: [
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () async {
                        print("$email $pswd");

                        dynamic result = await _auth.signInEmail(email, pswd);
                        if (result == null) {
                          print('error signing in');
                        } else {
                          print('signed in');
                          print(result.uid);
                        }

                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      },
                      child: Text(
                        "Sign in/ Register",
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 0, 48, 52)),
                    )),
                  ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
