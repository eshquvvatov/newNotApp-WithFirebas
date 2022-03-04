import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newwwwwwwwww/pages/login_pages/sign_in_page.dart';
import 'package:newwwwwwwwww/services/auth_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static String id = "/home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((event) {
      if (event == null) {
        Navigator.pushReplacementNamed(context, SignInPage.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              AuthService.signOut(context);
            },
            icon: Icon(Icons.code),
            color: Colors.black,
          ),
        ],
      ),
      body: Center(
        child: Text("home"),
      ),
    );
  }
}
