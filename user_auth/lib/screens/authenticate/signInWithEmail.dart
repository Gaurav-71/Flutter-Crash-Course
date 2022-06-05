import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:user_auth/models/customUser.dart';
import 'package:user_auth/services/auth.dart';
import 'package:user_auth/shared/loading.dart';

class SignInWithEmail extends StatefulWidget {
  const SignInWithEmail({Key? key}) : super(key: key);

  @override
  State<SignInWithEmail> createState() => _SignInWithEmailState();
}

class _SignInWithEmailState extends State<SignInWithEmail> {
  String email = "";
  String password = "";
  String error = "";
  bool loading = false;

  final AuthService _authService = AuthService();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.teal,
            ),
            home: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.teal,
                  title: Text("Sign Up With Email"),
                ),
                body: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 20.0),
                          TextFormField(
                            validator: (value) => value!.isEmpty
                                ? "Enter a valid email ID"
                                : null,
                            decoration: InputDecoration(
                                hintText: "Email ID *",
                                icon: Icon(Icons.email),
                                border: OutlineInputBorder(),
                                fillColor: Colors.white,
                                filled: true),
                            onChanged: (value) {
                              setState(() {
                                email = value;
                              });
                            },
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            validator: (value) => value!.length < 6
                                ? "Invalid Password : Minimum 6 characters"
                                : null,
                            obscureText: true,
                            decoration: InputDecoration(
                                hintText: "Password *",
                                icon: Icon(Icons.password),
                                border: OutlineInputBorder(),
                                fillColor: Colors.white,
                                filled: true),
                            onChanged: (value) {
                              setState(() {
                                password = value;
                              });
                            },
                          ),
                          SizedBox(height: 20.0),
                          ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    loading = true;
                                  });
                                  dynamic result = await _authService
                                      .signInWithEmailAndPassword(
                                          email, password);
                                  if (result is CustomUser) {
                                    Navigator.of(context).pop();
                                  } else {
                                    setState(() {
                                      error = result;
                                      loading = false;
                                    });
                                  }
                                }
                              },
                              child: Text(
                                "Sign In",
                                style: TextStyle(color: Colors.white),
                              )),
                          SizedBox(height: 20.0),
                          Text(
                            error,
                            style: TextStyle(color: Colors.red, fontSize: 14.0),
                          )
                        ],
                      )),
                )),
          );
  }
}
