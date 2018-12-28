import 'dart:convert';

import 'package:flutter_event/models/event.dart';
import 'package:flutter_event/utils/network_utils.dart';
import 'package:flutter/services.dart';

class EventService {
  NetworkUtil _http = new NetworkUtil();

  Future<List> getAll() async {
    var str = await rootBundle.loadString("lib/assets/events.json");
    final List jsonRes = json.decode(str);
    var result = jsonRes.map((item) => new Event.fromJson(item)).toList();
    //Simulate network connection
    await Future.delayed(Duration(seconds: 3));
    return result;
  }
}
