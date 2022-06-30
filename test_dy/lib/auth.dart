import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_dy/login.dart';
import 'package:test_dy/register.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final _formKeys = GlobalKey<FormState>();
  String _password = '';
  var loading = false;
  bool obsecure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: _formKeys,
            child: Padding(
              padding: const EdgeInsets.only(top: 200),
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
                    padding:
                        const EdgeInsets.only(right: 200, top: 10, bottom: 0),
                    child: Text(
                      "Sign In",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
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
                    validator: (value) =>
                        value != _password ? 'your pass error try again' : null,
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
                              obsecure = !obsecure;
                            });
                          },
                          child: Icon(obsecure
                              ? Icons.visibility
                              : Icons.visibility_off),
                        )),
                    obscureText: obsecure,
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 70),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Don't have account ?"),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Register()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 45),
                      child: Text(
                        "SignUp",
                        style: TextStyle(color: Colors.black54),
                      ),
                    )),
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
          ),
        ],
      ),
    );
  }
}
