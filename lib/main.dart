import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:newwwwwwwwww/pages/home_page.dart';
import 'package:newwwwwwwwww/pages/login_pages/sign_in_page.dart';
import 'package:newwwwwwwwww/pages/login_pages/sign_up_page.dart';
import 'package:newwwwwwwwww/services/auth_services.dart';
import 'package:newwwwwwwwww/services/hive_service.dart';
import 'package:hive_flutter/hive_flutter.dart';


void main() async{
  await Hive.initFlutter();
  await Hive.openBox(HiveDB.nameBase);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  _check(){
     final FirebaseAuth auth = FirebaseAuth.instance;
     final User? user = auth.currentUser;
     final userred = auth.userChanges();
     userred.listen((event) {
       print(event.toString());
     });
     if(user == null){
       HiveDB.deleteUser();
       return SignInPage();
     }
     HiveDB.putUser(id: user.uid);
     return HomePage();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     _check();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _check(),
      routes: {
        SignInPage.id:(context) => SignInPage(),
        SignUpPage.id:(context) => SignUpPage(),
        HomePage.id:(context) => HomePage(),
      },
    );
  }
}
