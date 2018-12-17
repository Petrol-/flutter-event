import 'package:flutter/material.dart';
import './main.dart';
import './all_events.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(child: Text('My home page')),
          ],
        ),
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
                Navigator.pop(context); //TODO Why pop then push ?
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UpcomingEvents()));
              },
            ),
            ListTile(
              title: Text('Logout', style: new TextStyle(fontSize: 16.0)),
              leading: new Icon(Icons.local_mall, size: 25.0),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
