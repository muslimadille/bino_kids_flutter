// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_with_filter_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductsWithFilterBaseModelAdapter
    extends TypeAdapter<ProductsWithFilterBaseModel> {
  @override
  final int typeId = 16;

  @override
  ProductsWithFilterBaseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductsWithFilterBaseModel(
      status: fields[0] as int?,
      message: fields[1] as String?,
      data: fields[2] as ProductsWithFilterModel?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductsWithFilterBaseModel obj) {
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
      other is ProductsWithFilterBaseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProductsWithFilterModelAdapter
    extends TypeAdapter<ProductsWithFilterModel> {
  @override
  final int typeId = 17;

  @override
  ProductsWithFilterModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductsWithFilterModel(
      status: fields[0] as num?,
      message: fields[1] as String?,
      next: fields[2] as bool?,
      filters: fields[3] as Filters?,
      modelTypes: fields[4] as dynamic,
      price: fields[5] as Price?,
      modelList: (fields[6] as List?)?.cast<ProductModel>(),
      imageList: fields[7] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, ProductsWithFilterModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.status)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.next)
      ..writeByte(3)
      ..write(obj.filters)
      ..writeByte(4)
      ..write(obj.modelTypes)
      ..writeByte(5)
      ..write(obj.price)
      ..writeByte(6)
      ..write(obj.modelList)
      ..writeByte(7)
      ..write(obj.imageList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductsWithFilterModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
