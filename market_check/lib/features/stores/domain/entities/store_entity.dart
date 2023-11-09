class StoreEntity {
  final int id;
  final String name;
  final String? caption; //It can be null
  final DateTime creationDate;
  final String poster;
  final String posterLogo;
  final int color;
  final int titleColor;
  final List<StoreLocation> locations;

  StoreEntity({
    required this.id,
    required this.name,
    required this.caption,
    required this.creationDate,
    required this.poster,
    required this.posterLogo,
    required this.color,
    required this.titleColor,
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
