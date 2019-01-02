import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_event/services/event_service.dart';
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
  final _eventService = new EventService();

  BuildContext _context;

  @override
  void initState() {
    _loadEvents();
    super.initState();
  }

  void _loadEvents() async {
    await _eventService.getAll();
  }

  @override
  Widget build(BuildContext context) {
    this._context = context;

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("lib/assets/login_bg.jpg"))),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.1)),
              ),
            )),
        Center(
          child: Form(
            key: _formKey,
            child: Center(
              child: Container(
                width: 300,
                height: 350,
                child: Card(
                  // color: Colors.blue,
                  elevation: 8.0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 24),
                          child: Text(
                            "Login",
                            style: Theme.of(context).textTheme.headline,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            autofocus: false,
                            decoration: InputDecoration(
                                hintText: 'Enter username',
                                labelText: "Username",
                                border: OutlineInputBorder(),
                                // contentPadding:
                                //     EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                                // border: OutlineInputBorder(
                                //     borderRadius: BorderRadius.circular(32.0)),
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
                              hintText: 'Enter password',
                              labelText: "Pasword",
                              border: OutlineInputBorder()
                              // contentPadding:
                              //     EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              // border: OutlineInputBorder(
                              //     borderRadius: BorderRadius.circular(32.0)),
                            ),
                            validator: LoginFormValidation.validatePassword,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 16),
                          child: Material(
                            // borderRadius: BorderRadius.circular(30.0),
                            // shadowColor: Colors.lightGreen.shade400,
                            // elevation: 5.0,
                            child: MaterialButton(
                              minWidth: 200.0,
                              height: 42.0,
                              onPressed: _login,
                              color: Colors.lightBlueAccent,
                              child: Text('Log In',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  void _login() {
    if ((_formKey.currentState.validate())
        // &&
        // ((usernameConttroler.text == "test") &&
        //     ((passwordConttroler.text == "010203"))
        //     )
        ) {
      Scaffold.of(_context)
          .showSnackBar(SnackBar(content: Text('You have logged')));

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }
}
