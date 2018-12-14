import 'package:flutter/material.dart';
import './event_detail.dart';

final _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);

enum EventSate { done, notStarted }

class Event extends StatelessWidget {
  final String title;
  final EventSate state;
  final String description;
  final IconData iconLocation;

  const Event({
    Key key,
    @required this.title,
    @required this.state,
    @required this.description,
    @required this.iconLocation,
  })  : assert(title != null),
        assert(description != null),
        assert(state != null),
        assert(iconLocation != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: new BoxDecoration(border: new Border.all(color: Colors.grey[500])),
        height: _rowHeight,
        child: InkWell(
          borderRadius: _borderRadius,
          highlightColor: Colors.blue[300],
          splashColor: Colors.blue[300],
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EventDetail(
                          event: this,
                        )));
          },
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Icon(
                    iconLocation,
                    size: 60.0,
                  ),
                ),
                Center(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline,
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
