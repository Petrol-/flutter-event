class Event {
  String _title;
  String _description;

  Event(this._title, this._description);
  Event.fromJson(dynamic obj) {
    this._title = obj['title'];
    this._description = obj['description'];
  }

  String get title => _title;
  String get description => _description;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["title"] = _title;
    map["description"] = _description;
    return map;
  }
}
