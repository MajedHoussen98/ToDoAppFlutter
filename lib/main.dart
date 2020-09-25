import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intro_login_rigester/activates/add_task.dart';
import 'package:intro_login_rigester/activates/auth_activity.dart';
import 'package:intro_login_rigester/activates/home_activity.dart';
import 'activates/intro_activity.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ToDO App",
      theme: ThemeData(
        primaryColor: Colors.deepPurpleAccent,
        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          headline2: TextStyle(
              fontSize: 22,
              color: Colors.black.withAlpha(160),
              fontWeight: FontWeight.bold),
          headline3:
              TextStyle(fontSize: 20, color: Colors.white.withAlpha(140)),
          headline4:
              TextStyle(fontSize: 16, color: Colors.black.withAlpha(120)),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.deepPurple[50],
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.deepPurple[100]),
              borderRadius: BorderRadius.circular(20)),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.deepPurple[100]),
              borderRadius: BorderRadius.circular(20)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.deepPurple[100]),
              borderRadius: BorderRadius.circular(20)),
        ),
      ),
      home: IntroActivity(),
      routes: {
        "login": (context) => AuthActivity(
              authType: AuthType.login,
            ),
        "register": (context) => AuthActivity(
              authType: AuthType.register,
            ),
        "home": (context) => HomeActivity(),
        "add_task": (context) => AddTask(),
      },
    );
  }
}
