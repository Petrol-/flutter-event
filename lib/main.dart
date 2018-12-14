import 'package:flutter/material.dart';
import './login.dart';

void main() => runApp(MainPage());

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Login'),
          ),
          body: LoginPage()),
    );
  }
}

class AllEvents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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

class UpcomingEvents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Upcoming events'),
        ),
      body: Center(
        child: Text('Upcoming evenst'),
      ),
    );
  }
}
