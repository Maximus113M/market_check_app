class OfferEntity {
  final bool active;
  final int storeId;
  final int id;
  final DateTime date;
  final String name;
  final String poster;
  final List<dynamic>? items;
  final List<String>? categories;
  final String description;
  final int price;

  OfferEntity({
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
}
