import 'package:flutter/material.dart';
import 'package:test_dy/register.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKeys = GlobalKey<FormState>();
  String _password = '';
  bool sec = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 235,
                child: Image.asset('assets/bg.jpg'),
              ),
              Form(
                key: _formKeys,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 20, left: 10, top: 10, bottom: 15),
                        child: Text(
                          "Welcome to Fashion Daily",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, top: 10, bottom: 10),
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 40),
                        ),
                      ),
                      TextFormField(
                        validator: (value) =>
                            value.isEmpty ? 'Enter valid email' : null,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)),
                            labelText: "Enter your email",
                            hintText: "ex.example@gmail.com",
                            prefixIcon: Icon(Icons.email)),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        onChanged: (value) => _password = value,
                        validator: (value) => value != _password
                            ? 'your pass error try again'
                            : null,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            labelText: "Enter your password",
                            labelStyle: TextStyle(color: Colors.black54),
                            prefixIcon: Icon(Icons.vpn_key),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  sec = !sec;
                                });
                              },
                              child: Icon(sec
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            )),
                        obscureText: sec,
                      ),
                      Container(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()));
                              },
                              child: Text(
                                "Forget Password ?",
                                style: TextStyle(color: Colors.black54),
                              ))),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {},
                    child: Text(
                      "Sign in",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Don't have account ?"),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 45),
                          child: Text(
                            "SignUp",
                            style: TextStyle(color: Colors.black54),
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: 20, left: 10, top: 10, bottom: 15),
                child: Text(
                  "User the application according to policy rules. Any kinds of violations will be subject to sanctions",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ],
          ),
        ));
  }
}
