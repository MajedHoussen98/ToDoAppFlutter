import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intro_login_rigester/widgets/auth_form.dart';

enum AuthType { login, register }

class AuthActivity extends StatelessWidget {
  final AuthType authType;

  const AuthActivity({Key key,  @required this.authType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation){
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
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                        ),
                      ),
                      Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: orientation == Orientation.portrait ? 50 : 30,
                            ),
                            Text(
                              "Hello!",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Bangers",
                                  fontSize: orientation == Orientation.portrait ? 90.0: 50,
                                  letterSpacing: 2),
                            ),
                            Image.asset(
                              "assets/images/intro.png",
                              width: orientation == Orientation.portrait ? 270: 300,
                              height: orientation == Orientation.portrait ? 300: 120,
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

      },
    );
  }
}
