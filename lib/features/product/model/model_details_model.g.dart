// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_details_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModelDetailsModelAdapter extends TypeAdapter<ModelDetailsModel> {
  @override
  final int typeId = 10;

  @override
  ModelDetailsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ModelDetailsModel(
      status: fields[0] as int?,
      message: fields[1] as dynamic,
      modelList: fields[2] as ModelList?,
    );
  }

  @override
  void write(BinaryWriter writer, ModelDetailsModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.status)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.modelList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelDetailsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ModelListAdapter extends TypeAdapter<ModelList> {
  @override
  final int typeId = 11;

  @override
  ModelList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ModelList(
      id: fields[0] as num?,
      modelType: fields[1] as dynamic,
      modelTypeName: fields[2] as String?,
      guId: fields[3] as String?,
      productData: fields[4] as String?,
      priceAfterDiscount: fields[5] as num?,
      priceBeforeDiscount: fields[6] as num?,
      minimumOrderLimitWholeSale: fields[7] as num?,
      imageUrl: fields[8] as String?,
      modelCode: fields[9] as String?,
      modelAgeName: fields[10] as String?,
      modelTradeMarkName: fields[11] as String?,
      modelDiscriptionName: fields[12] as String?,
      modelMaterialName: fields[13] as String?,
      colorId: fields[14] as num?,
      modelYear: fields[15] as num?,
      colorsList: fields[16] as dynamic,
      size: (fields[17] as List?)?.cast<AllSize>(),
      allSize: (fields[18] as List?)?.cast<AllSize>(),
      colors: (fields[19] as List?)?.cast<Color>(),
      wearWith: (fields[20] as List?)?.cast<dynamic>(),
      similar: (fields[21] as List?)?.cast<ProductModel>(),
      imageList: (fields[22] as List?)?.cast<ImageList>(),
      isFavorite: fields[24] as bool,
      wishListId: fields[23] as int,
      modelId: fields[25] as int,
      sizeId: fields[26] as num,
      modelColorId: fields[27] as num,
    );
  }

  @override
  void write(BinaryWriter writer, ModelList obj) {
    writer
      ..writeByte(28)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.modelType)
      ..writeByte(2)
      ..write(obj.modelTypeName)
      ..writeByte(3)
      ..write(obj.guId)
      ..writeByte(4)
      ..write(obj.productData)
      ..writeByte(5)
      ..write(obj.priceAfterDiscount)
      ..writeByte(6)
      ..write(obj.priceBeforeDiscount)
      ..writeByte(7)
      ..write(obj.minimumOrderLimitWholeSale)
      ..writeByte(8)
      ..write(obj.imageUrl)
      ..writeByte(9)
      ..write(obj.modelCode)
      ..writeByte(10)
      ..write(obj.modelAgeName)
      ..writeByte(11)
      ..write(obj.modelTradeMarkName)
      ..writeByte(12)
      ..write(obj.modelDiscriptionName)
      ..writeByte(13)
      ..write(obj.modelMaterialName)
      ..writeByte(14)
      ..write(obj.colorId)
      ..writeByte(15)
      ..write(obj.modelYear)
      ..writeByte(16)
      ..write(obj.colorsList)
      ..writeByte(17)
      ..write(obj.size)
      ..writeByte(18)
      ..write(obj.allSize)
      ..writeByte(19)
      ..write(obj.colors)
      ..writeByte(20)
      ..write(obj.wearWith)
      ..writeByte(21)
      ..write(obj.similar)
      ..writeByte(22)
      ..write(obj.imageList)
      ..writeByte(23)
      ..write(obj.wishListId)
      ..writeByte(24)
      ..write(obj.isFavorite)
      ..writeByte(25)
      ..write(obj.modelId)
      ..writeByte(26)
      ..write(obj.sizeId)
      ..writeByte(27)
      ..write(obj.modelColorId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AllSizeAdapter extends TypeAdapter<AllSize> {
  @override
  final int typeId = 12;

  @override
  AllSize read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AllSize(
      id: fields[0] as num?,
      arName: fields[1] as String?,
      enName: fields[2] as String?,
      idPrevious: fields[3] as num?,
      isEdited: fields[4] as bool?,
      name: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AllSize obj) {
    writer
      ..writeByte(6)
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
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AllSizeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ColorAdapter extends TypeAdapter<Color> {
  @override
  final int typeId = 13;

  @override
  Color read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Color(
      id: fields[0] as num?,
      arName: fields[1] as String?,
      enName: fields[2] as String?,
      colorDegree: fields[3] as dynamic,
      idPervious: fields[4] as num?,
      isEdited: fields[5] as bool?,
      modelId: fields[6] as num?,
      colorId: fields[7] as num?,
      imageName: fields[8] as String?,
      colorName: fields[9] as String?,
      arrange: fields[10] as num?,
      isHidden: fields[11] as bool?,
      isInWishList: fields[12] as bool?,
      sizesOfThisColorList: (fields[13] as List?)?.cast<AllSize>(),
      imageURL: fields[14] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Color obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.arName)
      ..writeByte(2)
      ..write(obj.enName)
      ..writeByte(3)
      ..write(obj.colorDegree)
      ..writeByte(4)
      ..write(obj.idPervious)
      ..writeByte(5)
      ..write(obj.isEdited)
      ..writeByte(6)
      ..write(obj.modelId)
      ..writeByte(7)
      ..write(obj.colorId)
      ..writeByte(8)
      ..write(obj.imageName)
      ..writeByte(9)
      ..write(obj.colorName)
      ..writeByte(10)
      ..write(obj.arrange)
      ..writeByte(11)
      ..write(obj.isHidden)
      ..writeByte(12)
      ..write(obj.isInWishList)
      ..writeByte(13)
      ..write(obj.sizesOfThisColorList)
      ..writeByte(14)
      ..write(obj.imageURL);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ColorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ImageListAdapter extends TypeAdapter<ImageList> {
  @override
  final int typeId = 14;

  @override
  ImageList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImageList(
      imageName: fields[0] as String?,
      mainImage: fields[1] as bool?,
      colorId: fields[2] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, ImageList obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.imageName)
      ..writeByte(1)
      ..write(obj.mainImage)
      ..writeByte(2)
      ..write(obj.colorId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
