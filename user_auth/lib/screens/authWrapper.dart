import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_auth/models/customUser.dart';
import 'package:user_auth/screens/authenticate/authenticate.dart';
import 'package:user_auth/screens/authenticate/signIn.dart';
import 'package:user_auth/screens/home/home.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser?>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
