import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intro_login_rigester/widgets/auth_form.dart';

enum AuthType { login, register }

class AuthActivity extends StatelessWidget {
  final AuthType authType;

  const AuthActivity({Key key,  @required this.authType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                //element taken half screen
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                ),
              ),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Hello!",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Bangers",
                          fontSize: 90,
                          letterSpacing: 2),
                    ),
                    Image.asset(
                      "assets/images/intro.png",
                      width: 270,
                      height: 300,
                    ),
                  ],
                ),
              ),
            ],
          ),
          AuthForm(authType: authType,),
        ],
      ),
    ));
  }
}
