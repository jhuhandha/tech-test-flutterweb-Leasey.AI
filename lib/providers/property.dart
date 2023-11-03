import 'dart:collection';
import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';

class Property {
  String name = "";
  String address = "";
  String type = "";
  String image = "";

  Property({
    required this.name,
    required this.address,
    required this.type,
    required this.image,
  });

  Property.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    address = json['address'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['type'] = type;
    data['address'] = address;
    data['image'] = image;
    return data;
  }
}

class PropertyModel extends ChangeNotifier {
  final Storage _localStorage = window.localStorage;
  final List<Property> _items = [];

  UnmodifiableListView<Property> get items => UnmodifiableListView(_items);

  PropertyModel() {
    if (_localStorage['properties'] != null) {
      var decodedItems = jsonDecode(_localStorage['properties']!);
      for (var item in decodedItems) {
        _items.add(Property.fromJson(item));
      }
    }
  }

  void add(Property item) {
    _items.add(item);
    _localStorage['properties'] = jsonEncode(_items);
    notifyListeners();
  }

  void remove(index) {
    _items.removeAt(index);
    _localStorage['properties'] = jsonEncode(_items);
    notifyListeners();
  }
}
