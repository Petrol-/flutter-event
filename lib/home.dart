import 'package:flutter/material.dart';
import './main.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Text('My home page'),
      ),
      drawer: Drawer(
        child: ListView(
          //  padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Events'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text(
                'All events',
                style: new TextStyle(fontSize: 18.0),
              ),
              leading: new Icon(
                Icons.event,
                size: 25.0,
              ),
              onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AllEvents()));
              },
            ),
            ListTile(
              title:
                  Text('Upcoming events', style: new TextStyle(fontSize: 16.0)),
              leading: new Icon(Icons.event_available, size: 25.0),
              onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UpcomingEvents()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
