
import 'package:flutter/material.dart';
import 'package:flutter_event/widgets/event_tile.dart';


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


class AllEvents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    loadDate();
    return Scaffold(
      appBar: AppBar(
        title: Text('All Events'),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Center(
          child: EventList(),
        ),
      ),
    );
  }
}

class EventList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      addRepaintBoundaries: true,
      itemBuilder: (BuildContext context, int index) => _eventList[index],
      itemCount: _eventList.length,
    );
  }
}



