// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// You can read about packages here: https://flutter.io/using-packages/
import 'package:flutter/material.dart';
import './event.dart';


final List<Event> _eventList = new List<Event>();

/// The function that is called when main.dart is run.
/*void main() {
  init();
  print(_listEvent);
  runApp(UnitConverterApp());
}*/
void loadDate() {
  _eventList.clear();
// ignore: missing_function_parameters, duplicate_definition, missing_function_body, expected_executable
  _eventList.add(new Event(
      title: 'Flutter',
      state: EventSate.done,
      description: "Initiation à flutter",
      iconLocation: Icons.event));
  _eventList.add(new Event(
      title: '.NET Core',
      state: EventSate.notStarted,
      description: ".NET Core notions avancées",
      iconLocation: Icons.event));
  _eventList.add(new Event(
      title: 'Angular',
      state: EventSate.notStarted,
      description: "les nouveautées de angular 7",
      iconLocation: Icons.event));
}

/// This widget is the root of our application.
/// Currently, we just show one widget in our app.
class AllEvents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    loadDate();
    return Scaffold(
      appBar: AppBar(
        title: Text('All Events'),
      ),
      backgroundColor: Colors.blue[100],
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
      itemBuilder: (BuildContext context, int index) => _eventList[index],
      itemCount: _eventList.length,
    );
  }
}



