import 'package:flutter/material.dart';
import 'package:intro_login_rigester/widgets/original_button.dart';

class IntroActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              Image.asset(
                "assets/images/intro.png",
                width: 300,
                height: 300,
              ),
              OriginalButton(
                text: "Get Started",
                onPressed: () => Navigator.of(context).pushNamed("login"),
                textColor: Colors.deepPurpleAccent,
                backgroundColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
