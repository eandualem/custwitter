import 'package:custwitter/models/User.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  UserModel _userFromFirebase(User user) {
    return user != null ? UserModel(id: user.uid) : null;
  }

  Stream<UserModel> get user{
    return _auth.authStateChanges().map(_userFromFirebase); // .map((user) => _userFromFirebase) simplified
  }

  Future signUp(email, password) async{
    print("SignUp Action!");
    try {
      User user = (await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      )) as User;
    }
    on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      }
      else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    }
    catch (e) {
      print(e);
    }
  }

  Future signIn(email, password) async {
    print("SignIn Action!");
    try {
      User user = (await _auth.signInWithEmailAndPassword(
          email: email,
          password: password
      )) as User;
    }
    on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      }
      else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    catch (e) {
      print(e);
    }
  }
}