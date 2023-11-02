/*
import 'dart:convert';

OffersDbResponse offersDbResponseFromJson(String str) =>
    OffersDbResponse.fromJson(json.decode(str));

String offersDbResponseToJson(OffersDbResponse data) =>
    json.encode(data.toJson()); */

class OffersDbResponse {
  final int totalResults;
  final ActiveDates activeDates;
  final List<OfferDB> results;

  OffersDbResponse({
    required this.totalResults,
    required this.activeDates,
    required this.results,
  });

  factory OffersDbResponse.fromJson(Map<String, dynamic> json) =>
      OffersDbResponse(
        totalResults: json["total_results"],
        activeDates: ActiveDates.fromJson(json["active_dates"]),
        results:
            List<OfferDB>.from(json["results"].map((x) => OfferDB.fromJson(x))),
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

class OfferDB {
  final bool active;
  final int storeId;
  final int id;
  final DateTime date;
  final String name;
  final String poster;
  final List<dynamic> items;
  final List<String> categories;
  final String description;
  final double price;

  OfferDB({
    required this.active,
    required this.storeId,
    required this.id,
    required this.date,
    required this.name,
    required this.poster,
    required this.items,
    required this.categories,
    required this.description,
    required this.price,
  });

  factory OfferDB.fromJson(Map<String, dynamic> json) => OfferDB(
        active: json["active"],
        storeId: json["store-id"],
        id: json["id"],
        date: DateTime.parse(json["date"]),
        name: json["name"],
        poster: json["poster"],
        items: List<dynamic>.from(json["items"].map((x) => x)),
        categories: List<String>.from(json["categories"].map((x) => x)),
        description: json["description"],
        price: json["price"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "active": active,
        "store-id": storeId,
        "id": id,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "name": name,
        "poster": poster,
        "items": List<dynamic>.from(items.map((x) => x)),
        "tags": List<dynamic>.from(categories.map((x) => x)),
        "description": description,
        "price": price,
      };
}
