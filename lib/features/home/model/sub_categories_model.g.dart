// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_categories_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubCategoriesModelAdapter extends TypeAdapter<SubCategoriesModel> {
  @override
  final int typeId = 6;

  @override
  SubCategoriesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubCategoriesModel(
      status: fields[0] as int,
      message: fields[1] as String,
      data: (fields[2] as List).cast<SubCategoryDataModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, SubCategoriesModel obj) {
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
      other is SubCategoriesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SubCategoryDataModelAdapter extends TypeAdapter<SubCategoryDataModel> {
  @override
  final int typeId = 7;

  @override
  SubCategoryDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubCategoryDataModel(
      id: fields[0] as int,
      arName: fields[1] as String,
      enName: fields[2] as String,
      idPrevious: fields[3] as int,
      isEdited: fields[4] as bool,
      name: fields[5] as String,
      horizontalRowNumber: fields[6] as int,
      verticalRowNumber: fields[7] as int,
      isDynamic: fields[8] as bool,
      image: fields[9] as String?,
      imageNameList: (fields[10] as List).cast<ImageNameList>(),
      modelGenderId: fields[11] as int,
    );
  }

  @override
  void write(BinaryWriter writer, SubCategoryDataModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.arName)
      ..writeByte(2)
      ..write(obj.enName)
      ..writeByte(3)
      ..write(obj.idPrevious)
      ..writeByte(4)
      ..write(obj.isEdited)
      ..writeByte(5)
      ..write(obj.name)
      ..writeByte(6)
      ..write(obj.horizontalRowNumber)
      ..writeByte(7)
      ..write(obj.verticalRowNumber)
      ..writeByte(8)
      ..write(obj.isDynamic)
      ..writeByte(9)
      ..write(obj.image)
      ..writeByte(10)
      ..write(obj.imageNameList)
      ..writeByte(11)
      ..write(obj.modelGenderId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubCategoryDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ImageNameListAdapter extends TypeAdapter<ImageNameList> {
  @override
  final int typeId = 8;

  @override
  ImageNameList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImageNameList(
      id: fields[0] as int,
      modelId: fields[1] as int,
      modelTypeId: fields[2] as int,
      arrangeNumber: fields[3] as int,
      modelName: fields[4] as String,
      modelTypeName: fields[5] as String,
      imageName: fields[6] as String,
      arrange: fields[7] as int,
      imagePath: fields[8] as String,
      isActive: fields[9] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ImageNameList obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.modelId)
      ..writeByte(2)
      ..write(obj.modelTypeId)
      ..writeByte(3)
      ..write(obj.arrangeNumber)
      ..writeByte(4)
      ..write(obj.modelName)
      ..writeByte(5)
      ..write(obj.modelTypeName)
      ..writeByte(6)
      ..write(obj.imageName)
      ..writeByte(7)
      ..write(obj.arrange)
      ..writeByte(8)
      ..write(obj.imagePath)
      ..writeByte(9)
      ..write(obj.isActive);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageNameListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
