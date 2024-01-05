class Filters {
  final FilterTypeModel gender;
  final FilterTypeModel season;
  final FilterTypeModel modelAge;
  final FilterTypeModel material;
  final FilterTypeModel description;

  Filters({
    required this.gender,
    required this.season,
    required this.modelAge,
    required this.material,
    required this.description,
  });

  factory Filters.fromJson(Map<String, dynamic> json) => Filters(
    gender: FilterTypeModel.fromJson(json["gender"]??{}),
    season: FilterTypeModel.fromJson(json["season"]??{}),
    modelAge: FilterTypeModel.fromJson(json["modelAge"]??{}),
    material: FilterTypeModel.fromJson(json["material"]??{}),
    description: FilterTypeModel.fromJson(json["description"]??{}),
  );

  Map<String, dynamic> toJson() => {
    "gender": gender.toJson(),
    "season": season.toJson(),
    "modelAge": modelAge.toJson(),
    "material": material.toJson(),
    "description": description.toJson(),
  };
}
class FilterTypeModel {
  final String? filterName;
  final List<FilterListItemModel>? filterList;

  FilterTypeModel({
    required this.filterName,
    required this.filterList,
  });

  factory FilterTypeModel.fromJson(Map<String, dynamic> json) => FilterTypeModel(
    filterName: json["FilterName"]??'',
    filterList: json["FilterList"]==null?[]:List<FilterListItemModel>.from(json["FilterList"].map((x) => FilterListItemModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "FilterName": filterName,
    "FilterList": List<dynamic>.from(filterList!.map((x) => x.toJson())),
  };
}
class FilterListItemModel {
  final int id;
  final String text;

  FilterListItemModel({
    required this.id,
    required this.text,
  });

  factory FilterListItemModel.fromJson(Map<String, dynamic> json) => FilterListItemModel(
    id: json["ID"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "text": text,
  };
}