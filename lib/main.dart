import 'package:flutter/material.dart';

void main() => runApp(MainPage());

class MainPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Login'),
          ),
          body:LoginPage()
      ),
    );
  }
}

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginForm();
  }
}

class LoginForm extends State<LoginPage>{
  final _formKey = GlobalKey<FormState>();
  final usernameConttroler = TextEditingController();
  final passwordConttroler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        body: Center(
          child: Text('My home page'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Events'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('All events'),
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> AllEvents()));
                },
              ),
              ListTile(
                title: Text('Upcoming events'),
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> UpcomingEvents()));
                },
              ),
              ],
          ),
        ),
      );
  }
}

class AllEvents extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('All events'),
      ),
      body: Center(
        child: Text('All events'),
      ),
    );
  }
}

class UpcomingEvents extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: AppBar(
          title: Text('Upcoming events'),
        ),
      ),
      body: Center(
        child: Text('Upcoming evenst'),
      ),
    );
  }
}
