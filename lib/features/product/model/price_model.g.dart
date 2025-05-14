// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PriceAdapter extends TypeAdapter<Price> {
  @override
  final int typeId = 21;

  @override
  Price read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Price(
      filterName: fields[0] as String?,
      minPrice: fields[1] as num?,
      maxPrice: fields[2] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, Price obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.filterName)
      ..writeByte(1)
      ..write(obj.minPrice)
      ..writeByte(2)
      ..write(obj.maxPrice);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PriceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
