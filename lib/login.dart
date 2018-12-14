
import 'package:flutter/material.dart';
import './home.dart';

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginForm();
  }
}

class LoginForm extends State<LoginPage>{
  final _formKey = GlobalKey<FormState>();
  final usernameConttroler = TextEditingController();
  final passwordConttroler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Form(
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
                      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                    ),
                    controller: usernameConttroler,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your username';
                      }
                    },
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
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your password';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: RaisedButton(
                    onPressed: () {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if((_formKey.currentState.validate())&&((usernameConttroler.text=="test")
                          &&((passwordConttroler.text=="010203")))) {
                        // If the form is valid, we want to show a Snackbar
                        Scaffold.of(context)
                            .showSnackBar(SnackBar(content: Text('You have logged')));

                        Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
                      }
                    },
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}