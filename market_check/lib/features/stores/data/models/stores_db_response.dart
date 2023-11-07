// To parse this JSON data, do
//
//     final storesDbResponse = storesDbResponseFromJson(jsonString);

/*import 'dart:convert';

StoresDbResponse storesDbResponseFromJson(String str) => StoresDbResponse.fromJson(json.decode(str));

String storesDbResponseToJson(StoresDbResponse data) => json.encode(data.toJson());*/

class StoresDbResponse {
  final int totalResults;
  final ActiveDates activeDates;
  final List<StoreDB> results;

  StoresDbResponse({
    required this.totalResults,
    required this.activeDates,
    required this.results,
  });

  factory StoresDbResponse.fromJson(Map<String, dynamic> json) =>
      StoresDbResponse(
        totalResults: json["total_results"],
        activeDates: ActiveDates.fromJson(json["active_dates"]),
        results:
            List<StoreDB>.from(json["results"].map((x) => StoreDB.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total_results": totalResults,
        "active_dates": activeDates.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class ActiveDates {
  final DateTime maximum;
  final DateTime minimum;

  ActiveDates({
    required this.maximum,
    required this.minimum,
  });

  factory ActiveDates.fromJson(Map<String, dynamic> json) => ActiveDates(
        maximum: DateTime.parse(json["maximum"]),
        minimum: DateTime.parse(json["minimum"]),
      );

  Map<String, dynamic> toJson() => {
        "maximum":
            "${maximum.year.toString().padLeft(4, '0')}-${maximum.month.toString().padLeft(2, '0')}-${maximum.day.toString().padLeft(2, '0')}",
        "minimum":
            "${minimum.year.toString().padLeft(4, '0')}-${minimum.month.toString().padLeft(2, '0')}-${minimum.day.toString().padLeft(2, '0')}",
      };
}

class StoreDB {
  final int id;
  final String name;
  final String caption;
  final DateTime creationDate;
  final String poster;
  final String color;
  final List<Location> locations;

  StoreDB({
    required this.id,
    required this.name,
    required this.caption,
    required this.creationDate,
    required this.poster,
    required this.color,
    required this.locations,
  });

  factory StoreDB.fromJson(Map<String, dynamic> json) => StoreDB(
        id: json["id"],
        name: json["name"],
        caption: json["caption"],
        creationDate: DateTime.parse(json["creation-date"]),
        poster: json["poster"],
        color: json["color"],
        locations: List<Location>.from(
            json["locations"].map((x) => Location.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "caption": caption,
        "creation-date":
            "${creationDate.year.toString().padLeft(4, '0')}-${creationDate.month.toString().padLeft(2, '0')}-${creationDate.day.toString().padLeft(2, '0')}",
        "poster": poster,
        "color": color,
        "locations": List<dynamic>.from(locations.map((x) => x.toJson())),
      };
}

class Location {
  final String name;
  final String location;
  final String phoneNumber;

  Location({
    required this.name,
    required this.location,
    required this.phoneNumber,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        location: json["location"],
        phoneNumber: json["phone-number"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "location": location,
        "phone-number": phoneNumber,
      };
}
