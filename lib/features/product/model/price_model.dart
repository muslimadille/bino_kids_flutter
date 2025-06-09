import 'package:hive/hive.dart';

part 'price_model.g.dart';

@HiveType(typeId: 21)
class Price extends HiveObject {
  @HiveField(0)
  final String? filterName;
  @HiveField(1)
  final num? minPrice;
  @HiveField(2)
  final num? maxPrice;

  Price({
    required this.filterName,
    required this.minPrice,
    required this.maxPrice,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    filterName: json["filterName"] ?? '',
    minPrice: (json["minPrice"] ?? -1),
    maxPrice: (json["maxPrice"] ?? -1),
  );

  Map<String, dynamic> toJson() => {
    "filterName": filterName,
    "minPrice": minPrice,
    "maxPrice": maxPrice,
  };
}