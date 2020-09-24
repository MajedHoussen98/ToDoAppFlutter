import 'package:flutter/material.dart';
import 'package:intro_login_rigester/activates/auth_activity.dart';
import 'package:intro_login_rigester/services/auth.dart';
import 'package:intro_login_rigester/widgets/original_button.dart';

class AuthForm extends StatefulWidget {
  final AuthType authType;

  const AuthForm({Key key, @required this.authType}) : super(key: key);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = "", _password = '';
  AuthBase authBase = AuthBase();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            TextFormField(
              onChanged: (value) => _email = value,
              validator: (value) => value.isEmpty ? 'Enter your email' : null,
              decoration: InputDecoration(
                  labelText: "Enter your email", hintText: "test@email.com"),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              onChanged: (value) => _password = value,
              validator: (value) => value.length < 6
                  ? 'Your password must be larger than 6 character'
                  : null,
              decoration: InputDecoration(
                labelText: "Enter your password",
              ),
              obscureText: true,
            ),
            SizedBox(
              height: 30,
            ),
            OriginalButton(
                text: widget.authType == AuthType.login ? "Login" : "Register",
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    if (widget.authType == AuthType.login) {
                      await authBase.loginWithEmailAndPassword(
                          _email, _password);
                      Navigator.of(context).pushNamed("home");
                    } else {
                      print(_email);
                      await authBase.registerWithEmailAndPassword(
                          _email, _password);
                      Navigator.of(context).pushNamed("home");
                    }
                  }
                },
                textColor: Colors.white,
                backgroundColor: Colors.deepPurpleAccent),
            SizedBox(
              height: 16,
            ),
            FlatButton(
                onPressed: () {
                  if (widget.authType == AuthType.login)
                    Navigator.of(context).pushReplacementNamed("register");
                  else
                    Navigator.of(context).pushReplacementNamed("login");
                },
                child: Text(
                  widget.authType == AuthType.login
                      ? "Don\'t have an account?"
                      : "I have an account?",
                  style: TextStyle(color: Colors.black54, fontSize: 18),
                )),
          ],
        ),
      ),
    );
  }
}
