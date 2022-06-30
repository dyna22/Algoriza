import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_dy/login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _obscureText = true;
  final _formKeys = GlobalKey<FormState>();
  var loading = false;
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
                padding: const EdgeInsets.only(top: 30, right: 10, left: 10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextFormField(
                        validator: (value) =>
                            value.isEmpty ? 'Enter your Email' : null,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)),
                            labelText: "Email",
                            prefixIcon: Icon(Icons.email)),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextFormField(
                        validator: (value) =>
                            value.isEmpty ? 'Please Enter your Phone ' : null,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)),
                            labelText: "Phone number",
                            prefixIcon: Icon(Icons.add_ic_call_rounded)),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextFormField(
                        validator: (value) => value.length < 8
                            ? 'Enter more than 8 character'
                            : null,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)),
                            labelText: "New password",
                            prefixIcon: Icon(Icons.vpn_key),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              child: Icon(_obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            )),
                        obscureText: _obscureText,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Has any account ?",
                          style: TextStyle(color: Colors.black54),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()));
                              },
                              child: Text("Sign In here")),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 20, left: 10, top: 10, bottom: 15),
                      child: Text(
                        "By registering your account, you are  agree to our ",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: ElevatedButton(
                          onPressed: () {
                            // bottom sheet
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        children: [
                                          Text('Instructions:',
                                              style: TextStyle(fontSize: 24)),
                                          Text('   '),
                                          Text(
                                              'Any Condition Any Condition Any Condition Any Condition Any Condition.',
                                              style: TextStyle(fontSize: 17)),
                                          Text('   '),
                                          Text(
                                              'Any Condition Any Condition Any Condition Any Condition Any Condition.',
                                              style: TextStyle(fontSize: 17)),
                                          Text(
                                              'Any Condition Any Condition Any Condition Any Condition Any Condition.',
                                              style: TextStyle(fontSize: 17)),
                                          Text('   '),
                                          Text(
                                              'Any Condition Any Condition Any Condition Any Condition Any Condition',
                                              style: TextStyle(fontSize: 17))
                                        ],
                                      ));
                                });
                          },
                          child: Text("terms and conditions")),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
