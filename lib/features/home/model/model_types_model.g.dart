// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_types_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModelTypesModelAdapter extends TypeAdapter<ModelTypesModel> {
  @override
  final int typeId = 5;

  @override
  ModelTypesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ModelTypesModel(
      status: fields[0] as int?,
      message: fields[1] as dynamic,
      modelTypes: (fields[2] as List?)?.cast<SubCategoryDataModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, ModelTypesModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.status)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.modelTypes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelTypesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
