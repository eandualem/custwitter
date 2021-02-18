import 'package:custwitter/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth;

  AuthService(this._auth);

  UserModel _userFromFirebase(User user) {
    return user != null ? UserModel(id: user.uid) : null;
  }

  Stream<UserModel> get user{
    return _auth.authStateChanges().map(_userFromFirebase); // .map((user) => _userFromFirebase) simplified
  }

  Future<String> signUp(email, password) async{
    print("email = ${email} & password = ${password}");
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      return "Signed Up";
    }
    on FirebaseAuthException catch (e) {
      print("signUp error 1 ///=>>> ${e.message}");
    }
    catch (e) {
      print("signUp error 2 ///=>>> ${e.message}");
    }
    return null;
  }

  Future<String> signIn(email, password) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      return "Signed In";
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
    return null;
  }

  Future signOut() async
  {
    try{
      return await _auth.signOut();
    }
    catch(e) {
      print(e.toString());
      return null;
    }

  }
}