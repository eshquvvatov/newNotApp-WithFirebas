import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newwwwwwwwww/pages/login_pages/sign_in_page.dart';

class AuthService {
  static FirebaseAuth auth = FirebaseAuth.instance;

  static Future<User?> signUp({name, email, password}) async {
    UserCredential signUp = await auth.createUserWithEmailAndPassword(email: email, password: password);
    User? user = signUp.user;
    if(user != null){
      user.updateDisplayName(name);
    }
    return user;
  }

  static Future<User?> signIn({email, password}) async {
    UserCredential  singIn = await auth.signInWithEmailAndPassword(email: email, password: password);
    User? user = singIn.user;
    return user;
  }

  static signOut(BuildContext context) async {
    auth.signOut().then((value) => Navigator.pushReplacementNamed(context, SignInPage.id));
  }
}
