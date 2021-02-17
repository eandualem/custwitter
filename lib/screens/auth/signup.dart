import 'package:custwitter/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}): super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  AuthService _authService = new AuthService();
  String _email = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 8,
        title: Text("Sign Up"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: new Form(
            child: Column(
              children: [
                TextFormField( // Email Field
                  onChanged: (val) => setState((){
                    _email = val;
                  }),
                ),
                TextFormField( // Password Field
                  onChanged: (val) => setState((){
                    _email = val;
                  }),
                ),
                RaisedButton(
                  child: Text("SignUp"),
                  onPressed: () async => {_authService.signUp(_email, _password)}
                ),
                RaisedButton(
                  child: Text("SignIn"),
                  onPressed: () async => {_authService.signIn(_email, _password)}
                )
              ],
            )
        ),
      ),
    );
  }
}
