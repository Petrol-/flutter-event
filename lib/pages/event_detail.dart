import 'package:flutter/material.dart';
import 'package:flutter_event/widgets/event_tile.dart';

class EventDetail extends StatelessWidget {
  final EventTile event;

  EventDetail({Key key, @required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("${event.title}"),
      ),
      body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Event Title: " + event.title,
                textAlign: TextAlign.right,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Description:",
                textAlign: TextAlign.right,),
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(10.0),
                decoration:
                myBoxDecoration(), 
                child: Text(
                  '${event.description}',
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
            ],
          )),
    );
  }
}

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    border: Border.all(),
  );
}
