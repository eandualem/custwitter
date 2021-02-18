import 'package:custwitter/models/User.dart';
import 'package:custwitter/screens/auth/signup.dart';
import 'package:custwitter/screens/main/home.dart';
import 'package:custwitter/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(create: (_) => AuthService(FirebaseAuth.instance),),
        StreamProvider(create: (context) => context.read<AuthService>().user)
      ],
      child: MaterialApp(home: AuthenticationWrapper()),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserModel user = context.watch<UserModel>();
    if (user == null) return SignUp();
    else return Home();
  }
}

