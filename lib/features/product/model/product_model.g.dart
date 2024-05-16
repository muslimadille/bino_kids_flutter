// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductModelAdapter extends TypeAdapter<ProductModel> {
  @override
  final int typeId = 15;

  @override
  ProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductModel(
      id: fields[0] as num?,
      modelListId: fields[1] as num?,
      modelType: fields[2] as String?,
      guId: fields[3] as String?,
      productData: fields[4] as String?,
      material: fields[5] as String?,
      description: fields[6] as String?,
      priceAfter: fields[7] as num?,
      priceBefore: fields[8] as num?,
      imageUrl: fields[9] as String?,
      originalImageUrl: fields[10] as String?,
      modelCode: fields[11] as String?,
      modelTradeMarkName: fields[12] as String?,
      modelAgeName: fields[13] as String?,
      isInWishList: fields[14] as bool?,
      colorId: fields[15] as num?,
      isMoreThanThreeColors: fields[16] as bool?,
      colorsList: fields[17] as dynamic,
      colors: (fields[18] as List?)?.cast<Color>(),
      isInNewArrival: fields[19] as bool?,
      isInTodaysDeal: fields[20] as bool?,
      colorsCount: fields[21] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductModel obj) {
    writer
      ..writeByte(22)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.modelListId)
      ..writeByte(2)
      ..write(obj.modelType)
      ..writeByte(3)
      ..write(obj.guId)
      ..writeByte(4)
      ..write(obj.productData)
      ..writeByte(5)
      ..write(obj.material)
      ..writeByte(6)
      ..write(obj.description)
      ..writeByte(7)
      ..write(obj.priceAfter)
      ..writeByte(8)
      ..write(obj.priceBefore)
      ..writeByte(9)
      ..write(obj.imageUrl)
      ..writeByte(10)
      ..write(obj.originalImageUrl)
      ..writeByte(11)
      ..write(obj.modelCode)
      ..writeByte(12)
      ..write(obj.modelTradeMarkName)
      ..writeByte(13)
      ..write(obj.modelAgeName)
      ..writeByte(14)
      ..write(obj.isInWishList)
      ..writeByte(15)
      ..write(obj.colorId)
      ..writeByte(16)
      ..write(obj.isMoreThanThreeColors)
      ..writeByte(17)
      ..write(obj.colorsList)
      ..writeByte(18)
      ..write(obj.colors)
      ..writeByte(19)
      ..write(obj.isInNewArrival)
      ..writeByte(20)
      ..write(obj.isInTodaysDeal)
      ..writeByte(21)
      ..write(obj.colorsCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
