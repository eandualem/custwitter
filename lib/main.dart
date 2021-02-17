import 'package:custwitter/models/User.dart';
import 'package:custwitter/screens/wrapper.dart';
import 'package:custwitter/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return ErrorWidget("exception");
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamProvider<UserModel>.value(
              value: AuthService().user,
            child: MaterialApp(home: Wrapper(),),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return MaterialApp(home: Text("load...", ));
      },
    );
  }
}
