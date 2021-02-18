import 'package:custwitter/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: <Widget>[
          FlatButton.icon(
            label: Text("SignOut"),
            icon: Icon(Icons.person),
            onPressed: () async {context.read<AuthService>().signOut();},
          )],
      ),
    );
  }
}
