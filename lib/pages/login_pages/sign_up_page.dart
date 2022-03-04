import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:newwwwwwwwww/pages/home_page.dart';
import 'package:newwwwwwwwww/pages/login_pages/sign_in_page.dart';
import 'package:newwwwwwwwww/services/auth_services.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  static String id = "/sign_up_page";

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  _addUser() {
    String name = nameController.text.toString().trim();
    String email = emailController.text.toString().trim();
    String password = passwordController.text.toString().trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      return;
    }
    setState(() {
      isLoading = true;
    });

    AuthService.signUp(email: email, name: name, password: password)
        .then((value) {
      setState(() {
        isLoading = false;
      });
      Navigator.pushReplacementNamed(context, HomePage.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _textField(text: "Name", controller: nameController),
                SizedBox(height: 20),
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
                        text: "Already have an account?",
                        children: [
                          TextSpan(
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                              text: " Sign In",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushReplacementNamed(
                                      context, SignInPage.id);
                                }),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            isLoading
                ? Container(
                    alignment: Alignment.center,
                    color: Colors.white,
                    child: CircularProgressIndicator())
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  MaterialButton _button() {
    return MaterialButton(
      onPressed: _addUser,
      child: Text("Sign Up"),
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
