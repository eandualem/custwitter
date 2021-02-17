import 'package:custwitter/models/User.dart';
import 'package:custwitter/screens/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);

    if (user == null) {
      return SignUp();
    }
    return Home();
  }
}
