// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_categories_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MainCategoriesModelAdapter extends TypeAdapter<MainCategoriesModel> {
  @override
  final int typeId = 0;

  @override
  MainCategoriesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MainCategoriesModel(
      status: fields[0] as int,
      message: fields[1] as String,
      data: (fields[2] as List).cast<MainCategoriesDataModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, MainCategoriesModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.status)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MainCategoriesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MainCategoriesDataModelAdapter
    extends TypeAdapter<MainCategoriesDataModel> {
  @override
  final int typeId = 1;

  @override
  MainCategoriesDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MainCategoriesDataModel(
      id: fields[0] as int,
      name: fields[1] as String,
      modelAgeForMainPage: (fields[2] as List?)?.cast<ModelAgeForMainPage>(),
    );
  }

  @override
  void write(BinaryWriter writer, MainCategoriesDataModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.modelAgeForMainPage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MainCategoriesDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ModelAgeForMainPageAdapter extends TypeAdapter<ModelAgeForMainPage> {
  @override
  final int typeId = 2;

  @override
  ModelAgeForMainPage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ModelAgeForMainPage(
      id: fields[0] as int,
      arName: fields[1] as String,
      enName: fields[2] as String,
      text: fields[3] as String,
      moduleId: fields[4] as int,
      arrangement: fields[5] as int,
      guidId: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ModelAgeForMainPage obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.arName)
      ..writeByte(2)
      ..write(obj.enName)
      ..writeByte(3)
      ..write(obj.text)
      ..writeByte(4)
      ..write(obj.moduleId)
      ..writeByte(5)
      ..write(obj.arrangement)
      ..writeByte(6)
      ..write(obj.guidId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelAgeForMainPageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
