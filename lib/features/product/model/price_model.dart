class Price {
  final String? filterName;
  final num? minPrice;
  final num? maxPrice;

  Price({
    required this.filterName,
    required this.minPrice,
    required this.maxPrice,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    filterName: json["filterName"]??'',
    minPrice: json["minPrice"]??-1,
    maxPrice: json["maxPrice"]??-1,
  );

  Map<String, dynamic> toJson() => {
    "filterName": filterName,
    "minPrice": minPrice,
    "maxPrice": maxPrice,
  };
}