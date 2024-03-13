// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FiltersAdapter extends TypeAdapter<Filters> {
  @override
  final int typeId = 18;

  @override
  Filters read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Filters(
      gender: fields[0] as FilterTypeModel,
      season: fields[1] as FilterTypeModel,
      modelAge: fields[2] as FilterTypeModel,
      material: fields[3] as FilterTypeModel,
      description: fields[4] as FilterTypeModel,
    );
  }

  @override
  void write(BinaryWriter writer, Filters obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.gender)
      ..writeByte(1)
      ..write(obj.season)
      ..writeByte(2)
      ..write(obj.modelAge)
      ..writeByte(3)
      ..write(obj.material)
      ..writeByte(4)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FiltersAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FilterTypeModelAdapter extends TypeAdapter<FilterTypeModel> {
  @override
  final int typeId = 19;

  @override
  FilterTypeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FilterTypeModel(
      filterName: fields[0] as String?,
      filterList: (fields[1] as List?)?.cast<FilterListItemModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, FilterTypeModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.filterName)
      ..writeByte(1)
      ..write(obj.filterList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FilterTypeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FilterListItemModelAdapter extends TypeAdapter<FilterListItemModel> {
  @override
  final int typeId = 20;

  @override
  FilterListItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FilterListItemModel(
      id: fields[0] as int,
      text: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FilterListItemModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.text);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FilterListItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
