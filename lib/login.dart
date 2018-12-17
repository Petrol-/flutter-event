import 'package:flutter/material.dart';
import 'package:flutter_event/validation/login_form_validtion.dart';
import './home.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginForm();
  }
}

class LoginForm extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final usernameConttroler = TextEditingController();
  final passwordConttroler = TextEditingController();
  BuildContext _context;
  @override
  Widget build(BuildContext context) {
    this._context = context;
    return Form(
      key: _formKey,
      child: Container(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(60.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    autofocus: false,
                    decoration: InputDecoration(
                      hintText: 'Username',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                    ),
                    controller: usernameConttroler,
                    validator: LoginFormValidation.validateUsername,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: passwordConttroler,
                    autofocus: false,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                    ),
                    validator: LoginFormValidation.validatePassword,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    // borderRadius: BorderRadius.circular(30.0),
                    // shadowColor: Colors.lightGreen.shade400,
                    // elevation: 5.0,
                    child: MaterialButton(
                      minWidth: 200.0,
                      height: 42.0,
                      onPressed: _login,
                      color: Colors.lightBlueAccent,
                      child:
                          Text('Log In', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _login() {
    if ((_formKey.currentState.validate()) &&
        ((usernameConttroler.text == "test") &&
            ((passwordConttroler.text == "010203")))) {
      Scaffold.of(_context)
          .showSnackBar(SnackBar(content: Text('You have logged')));

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }
}
