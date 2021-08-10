import 'package:flutter/material.dart';

class PhoneLogin extends StatefulWidget {
  const PhoneLogin({Key? key}) : super(key: key);

  @override
  _PhoneLoginState createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  @override
  Widget build(BuildContext context) {
    var countryCodeController = TextEditingController(text: "+91");
    var phoneNumberController = TextEditingController();
    String number;

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
                    "Enter your Phone number to login",
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 48, 52), fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: countryCodeController,
                          decoration: InputDecoration(
                            labelText: "Country-Code",
                          ),
                        ),
                        flex: 1,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: TextFormField(
                            // onChanged: (value) {
                            //   setState(() {
                            //     phNumberLength= value.length.toString();
                            //   });
                            //   if (value.length == 10) {
                            //     setState(() {
                            //       validate = true;
                            //     });
                            //   } else {
                            //     validate = false;
                            //   }
                            // },
                            // maxLength: 10,
                            autofocus: true,
                            validator: (String? value){
                              return (value!.length < 10) ? 'Invalid number' : null;
                            },
                            keyboardType: TextInputType.phone,
                            controller: phoneNumberController,
                            decoration: InputDecoration(
                              // counterText: "$phNumberLength/10",
                                labelText: "Phone-Number",
                                hintText: "Enter your phone number"),
                          ),
                          flex: 3),
                    ],
                  ),
                  SizedBox(
                    height: 200,
                  ),
                  Row(children: [
                    Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            number =
                                "${countryCodeController.text}${phoneNumberController.text}";
                            print(number);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PasswordScreen()));
                          },
                          child: Text(
                            "Next",
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 0, 48, 52)
                          )),
                    ),
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

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({Key? key}) : super(key: key);

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
                      onPressed: () {},
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
