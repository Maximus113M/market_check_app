import 'package:flutter/material.dart';

class StoreEntity {
  final int id;
  final String name;
  final String? caption; //It can be null
  final DateTime creationDate;
  final String poster;
  final Color color;
  final List<StoreLocation> locations;

  StoreEntity({
    required this.id,
    required this.name,
    required this.caption,
    required this.creationDate,
    required this.poster,
    required this.color,
    required this.locations,
  });
}

class StoreLocation {
  final String name;
  final String location;
  final String? phoneNumber;

  StoreLocation({
    required this.name,
    required this.location,
    this.phoneNumber = 'No-number',
  });
}
