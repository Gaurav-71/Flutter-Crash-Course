import 'package:flutter/material.dart';
import 'package:user_auth/screens/authenticate/signInWithEmail.dart';
import 'package:user_auth/screens/authenticate/signUpWithEmail.dart';
import 'package:user_auth/services/auth.dart';
import 'package:user_auth/shared/loading.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 102, 136, 153),
              title: Text("Firebase Auth Demo"),
            ),
            body: Column(
              children: <Widget>[
                SizedBox(height: 40.0),
                Center(
                    child: ElevatedButton(
                  child: const Text("Sign In With Email ID"),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.teal,
                      padding:
                          EdgeInsets.symmetric(horizontal: 55, vertical: 15)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SignInWithEmail()),
                    );
                  },
                )),
                SizedBox(height: 20.0),
                Center(
                    child: ElevatedButton(
                  child: const Text("Sign Up With Email ID"),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.cyan,
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SignUpWithEmail()),
                    );
                  },
                )),
                SizedBox(height: 20.0),
                Center(
                    child: ElevatedButton(
                  child: const Text("Sign In Anonymously"),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.pink,
                      padding:
                          EdgeInsets.symmetric(horizontal: 55, vertical: 15)),
                  onPressed: () async {
                    setState(() {
                      loading = true;
                    });
                    dynamic result = await _authService.signInAnon();
                    if (result == null) {
                      print("Error Signing In");
                      setState(() {
                        loading = false;
                      });
                    } else {
                      print("Signed in > UID : " + result.uid);
                      setState(() {
                        loading = false;
                      });
                    }
                  },
                )),
              ],
            ));
  }
}
