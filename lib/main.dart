import 'package:flutter/material.dart';
import 'package:flutter_event/pages/login.dart';

void main ()=> runApp(MainPage());

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
          // appBar: AppBar(
          //   title: Text('Login'),
          // ),
          body: LoginPage()),
    );
  }
}



