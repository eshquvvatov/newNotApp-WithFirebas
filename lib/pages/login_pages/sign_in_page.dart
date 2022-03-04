import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:newwwwwwwwww/pages/home_page.dart';
import 'package:newwwwwwwwww/pages/login_pages/sign_up_page.dart';
import 'package:newwwwwwwwww/services/auth_services.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);
  static String id = "/sign_in_page";

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  _addUser() {
    String email = emailController.text.toString().trim();
    String password = passwordController.text.toString().trim();

    if (email.isEmpty || password.isEmpty) {
      return;
    }

    AuthService.signIn(email: email, password: password)
        .then((value) => Navigator.pushReplacementNamed(context, HomePage.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _textField(text: "Email", controller: emailController),
            SizedBox(height: 20),
            _textField(text: "Password", controller: passwordController),
            SizedBox(height: 30),
            _button(),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.black),
                    text: "Don't have an account?",
                    children: [
                      TextSpan(
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                          text: " Sign Up",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacementNamed(
                                  context, SignUpPage.id);
                            }),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  MaterialButton _button() {
    return MaterialButton(
      onPressed: _addUser,
      child: Text("Sign In"),
      color: Colors.blue,
      minWidth: double.infinity,
      textColor: Colors.white,
      height: 50,
      shape: StadiumBorder(),
    );
  }

  TextField _textField({text, controller}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(hintText: text),
    );
  }
}
