import 'package:flutter/material.dart';
import 'package:flutter_event/main.dart';
import 'package:flutter_event/models/event.dart';
import 'package:flutter_event/pages/all_events.dart';
import 'package:flutter_event/pages/upcoming_events.dart';
import 'package:flutter_event/services/event_service.dart';
import 'package:flutter_event/widgets/event_tile.dart';
import 'package:flutter_event/widgets/home_carousel.dart';

final List<EventTile> _eventList = new List<EventTile>();

void loadDate() {
  _eventList.clear();
  _eventList.add(new EventTile(
      title: 'Flutter',
      state: EventSate.done,
      description: "Initiation à flutter",
      iconLocation: Icons.event));
  _eventList.add(new EventTile(
      title: '.NET Core',
      state: EventSate.notStarted,
      description: ".NET Core notions avancées",
      iconLocation: Icons.event));
  _eventList.add(new EventTile(
      title: 'Angular',
      state: EventSate.notStarted,
      description: "les nouveautées de angular 7",
      iconLocation: Icons.event));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  final EventService _eventService = new EventService();
  List<Event> _events;
  var _refresKey = GlobalKey<RefreshIndicatorState>();
  @override
  void initState() {
    _refreshEvents();
    super.initState();
  }

  Future<Null> _refreshEvents() async {
    _refresKey.currentState?.show();
    var events = await _eventService.getAll();
    setState(() {
      _events = events;
    });
  }

  @override
  Widget build(BuildContext context) {
    // loadDate();
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            HomeCarousel(),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Text(
                  'My upcoming events:',
                  style: TextStyle(
                      // color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                )),
            Expanded(
                child: RefreshIndicator(
              key: _refresKey,
              onRefresh: _refreshEvents,
              child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemCount: _events == null ? 0 : _events.length,
                itemBuilder: (BuildContext context, int index) =>
                    _buildCard(context, _events[index]),
                // children: _eventList,
              ),
            )
                // FutureBuilder(
                //   future: _eventService.getAll(),
                //   builder: (context, snapshot) {
                //     if (!snapshot.hasData)
                //     return Center(
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: <Widget>[
                //           CircularProgressIndicator( ),
                //           Padding(
                //             padding: const EdgeInsets.only(top: 8),
                //             child: Text("loading..."),
                //           )
                //         ],
                //       ),
                //     );//Center(child: Text("loading..."));

                //     return ListView.builder(
                //       shrinkWrap: true,
                //       padding: const EdgeInsets.all(8),
                //       itemCount: snapshot.data == null ? 0 : snapshot.data.length,
                //       itemBuilder: (BuildContext context, int index) =>
                //           _buildCard(context, snapshot.data[index]),
                //       // children: _eventList,

                //     );
                //   },
                // ),
                )
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
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

  Widget _buildCard(BuildContext context, Event model) {
    return Card(
        elevation: 8.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Container(
          // decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
          child: EventTile(
            title: model.title,
            description: model.description,
            iconLocation: Icons.event,
            state: EventSate.notStarted,
          ),
        ));
  }
}
